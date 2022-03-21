class LightningTipDepositModel {
  bool? status;
  Data? data;
  String? message;

  LightningTipDepositModel({this.status, this.data, this.message});

  LightningTipDepositModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? amount;
  String? transactionType;
  String? transactionId;
  String? note;
  String? paymentMethod;
  int? fee;
  String? createdAt;
  int? netFiatValue;
  int? fiatValue;
  String? status;
  String? updatedAt;
  String? lightningAddress;
  String? lightningInvoiceExpiresAt;
  double? btcPrice;
  String? fiatCurrencyUnit;
  String? tipStatus;
  String? checkingId;
  String? paymentHash;
  int? gstRate;
  int? tdsRate;
  int? companyFee;
  int? gstAmount;
  int? tdsAmount;

  Data(
      {this.amount,
        this.transactionType,
        this.transactionId,
        this.note,
        this.paymentMethod,
        this.fee,
        this.createdAt,
        this.netFiatValue,
        this.fiatValue,
        this.status,
        this.updatedAt,
        this.lightningAddress,
        this.lightningInvoiceExpiresAt,
        this.btcPrice,
        this.fiatCurrencyUnit,
        this.tipStatus,
        this.checkingId,
        this.paymentHash,
        this.gstRate,
        this.tdsRate,
        this.companyFee,
        this.gstAmount,
        this.tdsAmount});

  Data.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    transactionType = json['transaction_type'];
    transactionId = json['transaction_id'];
    note = json['note'];
    paymentMethod = json['payment_method'];
    fee = json['fee'];
    createdAt = json['created_at'];
    netFiatValue = json['net_fiat_value'];
    fiatValue = json['fiat_value'];
    status = json['status'];
    updatedAt = json['updated_at'];
    lightningAddress = json['lightning_address'];
    lightningInvoiceExpiresAt = json['lightning_invoice_expires_at'];
    btcPrice = json['btc_price'];
    fiatCurrencyUnit = json['fiat_currency_unit'];
    tipStatus = json['tip_status'];
    checkingId = json['checking_id'];
    paymentHash = json['payment_hash'];
    gstRate = json['gst_rate'];
    tdsRate = json['tds_rate'];
    companyFee = json['company_fee'];
    gstAmount = json['gst_amount'];
    tdsAmount = json['tds_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['transaction_type'] = this.transactionType;
    data['transaction_id'] = this.transactionId;
    data['note'] = this.note;
    data['payment_method'] = this.paymentMethod;
    data['fee'] = this.fee;
    data['created_at'] = this.createdAt;
    data['net_fiat_value'] = this.netFiatValue;
    data['fiat_value'] = this.fiatValue;
    data['status'] = this.status;
    data['updated_at'] = this.updatedAt;
    data['lightning_address'] = this.lightningAddress;
    data['lightning_invoice_expires_at'] = this.lightningInvoiceExpiresAt;
    data['btc_price'] = this.btcPrice;
    data['fiat_currency_unit'] = this.fiatCurrencyUnit;
    data['tip_status'] = this.tipStatus;
    data['checking_id'] = this.checkingId;
    data['payment_hash'] = this.paymentHash;
    data['gst_rate'] = this.gstRate;
    data['tds_rate'] = this.tdsRate;
    data['company_fee'] = this.companyFee;
    data['gst_amount'] = this.gstAmount;
    data['tds_amount'] = this.tdsAmount;
    return data;
  }
}
