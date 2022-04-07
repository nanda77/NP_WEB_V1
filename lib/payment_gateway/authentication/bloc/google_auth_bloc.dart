import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjapay/payment_gateway/authentication/models/firebase_auth_model.dart';
import 'package:ninjapay/payment_gateway/authentication/services/auth_repo.dart';

class GoogleAuthEvent {}

class GoogleLoginEvent extends GoogleAuthEvent {
  GoogleLoginEvent();
}

class GoogleUserExistEvent extends GoogleAuthEvent {
  bool fromEmailLogin;
  GoogleUserExistEvent(this.fromEmailLogin);
}

class GoogleAuthState {}

class GoogleAuthInitialState extends GoogleAuthState {}

class GoogleAuthLoadingState extends GoogleAuthState {}

class GoogleAuthSuccessState extends GoogleAuthState {
  FirebaseAuthModel? response;
  GoogleAuthSuccessState(this.response);
}

class GoogleAuthErrorState extends GoogleAuthState {
  FirebaseAuthModel? errorResponse;
  GoogleAuthErrorState(this.errorResponse);
}

class GoogleUserExistLoadingState extends GoogleAuthState {}

class GoogleUserExistSuccessState extends GoogleAuthState {
  FirebaseAuthModel? response;
  GoogleUserExistSuccessState(this.response);
}

class GoogleUserExistErrorState extends GoogleAuthState {
  FirebaseAuthModel errorResponse;
  GoogleUserExistErrorState(this.errorResponse);
}

class GoogleAuthBloc extends Bloc<GoogleAuthEvent, GoogleAuthState> {
  final AuthRepository _authRepository;

  GoogleAuthBloc(this._authRepository) : super(GoogleAuthInitialState()) {
    on<GoogleLoginEvent>((event, emit) async {
      await _authRepository.googleLogin(event, emit);
    });

    on<GoogleUserExistEvent>((event, emit) async {
      await _authRepository.userExistsAPIGoogle(event, emit);
    });
  }

}