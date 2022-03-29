class CreatePaymentStates {}

class CreatePaymentInitialState extends CreatePaymentStates {}

class CreatePaymentLoadingState extends CreatePaymentStates {
  CreatePaymentLoadingState();
}

class CreatePaymentSuccessState extends CreatePaymentStates {
  String data;

  CreatePaymentSuccessState(this.data);
}

class CreatePaymentErrorState extends CreatePaymentStates {
  String message;

  CreatePaymentErrorState(this.message);
}
