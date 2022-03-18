class CreatePaymentEvents {}

class CreatePaymentRefreshEvent extends CreatePaymentEvents {
  String amount;
  String purpose;

  CreatePaymentRefreshEvent(this.amount, this.purpose);
}
