import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjapay/payment_gateway/authentication/models/firebase_auth_model.dart';
import 'package:ninjapay/payment_gateway/authentication/services/auth_repo.dart';

class EmailEvent {}

class SendEmailRefreshEvent extends EmailEvent {
  String email;
  SendEmailRefreshEvent(this.email);
}

class VerifyEmailRefreshEvent extends EmailEvent {
  String email, link;
  VerifyEmailRefreshEvent(this.email, this.link);
}

class EmailState {}

class SendEmailInitialState extends EmailState {}

class SendEmailLoadingState extends EmailState {}

class SendEmailSuccessState extends EmailState {
  FirebaseAuthModel? response;
  SendEmailSuccessState(this.response);
}

class SendEmailErrorState extends EmailState {
  FirebaseAuthModel? errorResponse;
  SendEmailErrorState(this.errorResponse);
}

class VerifyEmailLoadingState extends EmailState {}

class VerifyEmailSuccessState extends EmailState {
  FirebaseAuthModel? response;
  VerifyEmailSuccessState(this.response);
}

class VerifyEmailErrorState extends EmailState {
  FirebaseAuthModel? errorResponse;
  VerifyEmailErrorState(this.errorResponse);
}

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  final AuthRepository _authRepository;

  EmailBloc(this._authRepository) : super(SendEmailInitialState()) {
    on<SendEmailRefreshEvent>((event, emit) async {
      await _authRepository.sendEmail(event, emit);
    });

    on<VerifyEmailRefreshEvent>((event, emit) async {
      await _authRepository.verifyEmail(event, emit);
    });
  }

}