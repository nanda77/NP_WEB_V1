import 'dart:convert' as convert;
import 'package:bloc/src/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ninjapay/api_provider.dart';
import 'package:ninjapay/app_utils.dart';
import 'package:ninjapay/payment_gateway/authentication/bloc/google_auth_bloc.dart';
import 'package:ninjapay/payment_gateway/authentication/bloc/send_email_bloc.dart';
import 'package:ninjapay/payment_gateway/authentication/bloc/send_otp_bloc.dart';
import 'package:ninjapay/payment_gateway/authentication/models/firebase_auth_model.dart';
import 'package:ninjapay/payment_gateway/common_component/alert_message.dart';

class AuthRepository{
  static String? accessToken;
  static String? refreshToken;
  static String? uuid;

  AuthRepository._privateConstructor();

  static final AuthRepository instance = AuthRepository._privateConstructor();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  ApiProvider apiProvider = ApiProvider();
  AppUtils appUtils = AppUtils();
  Map<String, String> headers = {};
  FirebaseAuthModel firebaseAuthModel = FirebaseAuthModel();
  late Future<ConfirmationResult> confirmationResult;

  //---------------------------google login----------------------------

  Future<void> googleLogin(GoogleLoginEvent event, Emitter<GoogleAuthState> emit) async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();
    googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({
      'login_hint': 'abc@gmail.com'
    });
    try{
      // Once signed in, return the UserCredential
      await _auth.signInWithPopup(googleProvider).then((value) async {
        User? user = value.user;
        if (user != null) {
          firebaseAuthModel = FirebaseAuthModel(status: true);
          appUtils.setFirebaseUId(user.uid);
          appUtils.setUserEmail(user.email ?? "");
          appUtils.setUserNumber(user.phoneNumber ?? "");
          appUtils.setFCMToken(await user.getIdToken());
          firebaseAuthModel = FirebaseAuthModel(status: true, message: 'Success.');
          emit(GoogleAuthSuccessState(firebaseAuthModel));
        }
        else {
          firebaseAuthModel = FirebaseAuthModel(status: false, message: 'Failed to sign in.');
          emit(GoogleAuthErrorState(firebaseAuthModel));
        }
      }).onError((error, stackTrace) {
        firebaseAuthModel = FirebaseAuthModel(status: false, message: error.toString());
        emit(GoogleAuthErrorState(firebaseAuthModel));
      });
    } catch(error){
      firebaseAuthModel = FirebaseAuthModel(status: false, message: AlertMessages.GENERIC_ERROR_MSG);
      emit(GoogleAuthErrorState(firebaseAuthModel));
    }
  }

  //---------------------------user exist------------------------------

  Future<void> userExistsAPIGoogle(GoogleUserExistEvent event, Emitter<GoogleAuthState> emit) async {
    emit(GoogleUserExistLoadingState());
    try {
      String? token = await appUtils.getFCMToken();
      print("refresh token: $token}");
      await apiProvider.userExist("").then((value) async {
        if(value?.status != null && value?.status == true){
          firebaseAuthModel = FirebaseAuthModel(
              status: true,
              message: 'User already register.',
              userExist: true,
              fromEmailLogin: event.fromEmailLogin
          );
        }
        else{
          firebaseAuthModel = FirebaseAuthModel(
              status: true,
              message: 'New user.',
              userExist: false,
              fromEmailLogin: event.fromEmailLogin);
        }
        emit(GoogleUserExistSuccessState(firebaseAuthModel));
      });
    } catch (e) {
      firebaseAuthModel = FirebaseAuthModel(
        status: false,
        message: e.toString(),
        fromEmailLogin: event.fromEmailLogin
      );
      emit(GoogleUserExistErrorState(firebaseAuthModel));
    }
  }

  //---------------------------Send OTP------------------------------

  Future<void> sendOtp(SendOtpRefreshEvent event, Emitter<OtpState> emit) async {
    firebaseAuthModel = FirebaseAuthModel(status: false, message: 'loading.', sendOtp: true);
    emit(SendOtpLoadingState());
    FirebaseAuth auth = FirebaseAuth.instance;

    try{
      confirmationResult = auth.signInWithPhoneNumber(event.number);
      firebaseAuthModel = FirebaseAuthModel(
          status: true,
          message: 'OTP sent successfully.',
          verificationId: "",
          sendOtp: true);
      emit(SendOtpSuccessState(firebaseAuthModel));
    } catch(error){
      firebaseAuthModel = FirebaseAuthModel(
          status: false,
          message: AlertMessages.GENERIC_ERROR_MSG,
          sendOtp: true);
      emit(SendOtpErrorState(firebaseAuthModel));
    }

  }

  //---------------------------OTP Verify------------------------------

  Future<void> verifyOtp(VerifyOtpRefreshEvent event, Emitter<OtpState> emit) async {
    emit(VerifyOtpLoadingState());
    try {

      await confirmationResult.then((value) async {
        await value.confirm(event.otp).then((credential) async {
          User? user = credential.user;
          if(user != null){
            firebaseAuthModel = FirebaseAuthModel(status: true, message: 'Otp verified successfully.');
            appUtils.setFirebaseUId(user.uid);
            appUtils.setUserNumber(user.phoneNumber??"");
            appUtils.setUserEmail(user.email??"");
            appUtils.setFCMToken(await user.getIdToken());
           emit(VerifyOtpSuccessState(firebaseAuthModel));
          }
          else{
            firebaseAuthModel = FirebaseAuthModel(
              status: false,
              message: 'Phone number verification failed.',
              userExist: false
            );
            emit(VerifyOtpErrorState(firebaseAuthModel));
          }
        });
      });

    } catch (e) {
      firebaseAuthModel = FirebaseAuthModel(status: false, message: AlertMessages.GENERIC_ERROR_MSG);
      emit(VerifyOtpErrorState(firebaseAuthModel));
    }
  }

  //---------------------------Send Email------------------------------

  Future<void> sendEmail(SendEmailRefreshEvent event, Emitter<EmailState> emit) async {
    try {
      emit(SendEmailLoadingState());
      await _auth.sendSignInLinkToEmail(
        email: event.email,
        actionCodeSettings: ActionCodeSettings(
          url: 'https://ninjapay.page.link/verify',
          // dynamicLinkDomain: 'https://ninjapay-192c0.firebaseapp.com',
          handleCodeInApp: true,
          iOSBundleId: 'com.google.firebase.lightninFlutter',
          androidPackageName: 'com.google.lightnin_flutter',
          androidInstallApp: true,
          androidMinimumVersion: "12",
        ),
      ).whenComplete(() {
        firebaseAuthModel = FirebaseAuthModel(
            status: true,
            message: 'Link send successfully please check your email.'
        );
        emit(SendEmailSuccessState(firebaseAuthModel));
      });
    } catch (e) {
      firebaseAuthModel = FirebaseAuthModel(status: false, message: AlertMessages.GENERIC_ERROR_MSG);
      emit(SendEmailErrorState(firebaseAuthModel));
    }
  }

  //---------------------------Verify Email------------------------------

  Future<void> verifyEmail(VerifyEmailRefreshEvent event, Emitter<EmailState> emit) async {
    try {
      await _auth.signInWithEmailLink(
        email: event.email,
        emailLink: event.link,
      ).then((value) async {
        User? user = value.user;
        if (user != null) {
          firebaseAuthModel = FirebaseAuthModel(status: true, message: 'Email authentication successfully.');
          appUtils.setFirebaseUId(user.uid);
          appUtils.setUserNumber(user.phoneNumber??"");
          appUtils.setUserEmail(user.email??"");
          appUtils.setFCMToken(await user.getIdToken());
          firebaseAuthModel = FirebaseAuthModel(status: true, message: 'success');
          emit(VerifyEmailSuccessState(firebaseAuthModel));
        } else {
          firebaseAuthModel = FirebaseAuthModel(status: false, message: 'Email  failed.');
          emit(VerifyEmailErrorState(firebaseAuthModel));
        }
      }).onError((error, stackTrace) {
        firebaseAuthModel = FirebaseAuthModel(status: false, message: 'Email authentication failed.');
        emit(VerifyEmailErrorState(firebaseAuthModel));
      });
    } catch (e) {
      firebaseAuthModel = FirebaseAuthModel(status: false, message: AlertMessages.GENERIC_ERROR_MSG);
      emit(VerifyEmailErrorState(firebaseAuthModel));
    }
  }

}