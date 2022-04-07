
import 'package:ninjapay/payment_gateway/payment_link/model/get_link_payments_model.dart';

class GetLinkPaymentStates {}

class GetLinkPaymentInitialState extends GetLinkPaymentStates {}

class GetLinkPaymentLoadingState extends GetLinkPaymentStates {}

class GetLinkPaymentSuccessState extends GetLinkPaymentStates {
  GetLinkPaymentsModel data;

  GetLinkPaymentSuccessState(this.data);
}

class GetLinkPaymentErrorState extends GetLinkPaymentStates {
  String data;

  GetLinkPaymentErrorState(this.data);
}
