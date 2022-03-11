class GetLinkPaymentStates {}

class GetLinkPaymentInitialState extends GetLinkPaymentStates {}

class GetLinkPaymentLoadingState extends GetLinkPaymentStates {
  GetLinkPaymentLoadingState();
}

class GetLinkPaymentSuccessState extends GetLinkPaymentStates {
  String data;

  GetLinkPaymentSuccessState(this.data);
}

class GetLinkPaymentErrorState extends GetLinkPaymentStates {
  String data;

  GetLinkPaymentErrorState(this.data);
}
