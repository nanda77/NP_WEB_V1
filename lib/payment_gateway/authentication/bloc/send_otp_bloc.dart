import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjapay/payment_gateway/authentication/models/firebase_auth_model.dart';
import 'package:ninjapay/payment_gateway/authentication/services/auth_repo.dart';

class OtpEvent {}

class SendOtpRefreshEvent extends OtpEvent {
  String number;
  SendOtpRefreshEvent(this.number);
}

class VerifyOtpRefreshEvent extends OtpEvent {
  String otp, verificationId;
  VerifyOtpRefreshEvent(this.otp, this.verificationId);
}

class OtpState {}

class SendOtpInitialState extends OtpState {}

class SendOtpLoadingState extends OtpState {}

class SendOtpSuccessState extends OtpState {
  FirebaseAuthModel? response;
  SendOtpSuccessState(this.response);
}

class SendOtpErrorState extends OtpState {
  FirebaseAuthModel? errorResponse;
  SendOtpErrorState(this.errorResponse);
}

class VerifyOtpLoadingState extends OtpState {}

class VerifyOtpSuccessState extends OtpState {
  FirebaseAuthModel? response;
  VerifyOtpSuccessState(this.response);
}

class VerifyOtpErrorState extends OtpState {
  FirebaseAuthModel? errorResponse;
  VerifyOtpErrorState(this.errorResponse);
}

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final AuthRepository _authRepository;

  OtpBloc(this._authRepository) : super(SendOtpInitialState()) {
    on<SendOtpRefreshEvent>((event, emit) async {
      await _authRepository.sendOtp(event, emit);
    });

    on<VerifyOtpRefreshEvent>((event, emit) async {
      await _authRepository.verifyOtp(event, emit);
    });
  }

}