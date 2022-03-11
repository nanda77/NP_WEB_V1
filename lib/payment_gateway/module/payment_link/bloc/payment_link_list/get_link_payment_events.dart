class GetLinkPaymentEvents {}

class GetLinkPaymentRefreshEvent extends GetLinkPaymentEvents {
  String amount;
  String purpose;

  GetLinkPaymentRefreshEvent(this.amount, this.purpose);
}
