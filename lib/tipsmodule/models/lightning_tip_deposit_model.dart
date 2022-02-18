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
  int? id;
  String? userId;
  int? amount;
  dynamic orderId;
  String? currency;
  String? description;
  dynamic successUrl;
  int? sourceFiatValue;
  int? fiatValue;
  bool? autoSettle;
  dynamic notifEmail;
  String? metadata;
  String? uri;
  int? ttl;
  String? lightningInvoicePayReq;
  String? transactionId;
  String? lightningInvoiceExpiresAt;
  String? status;
  String? createdAt;
  String? transactionsCreatedAt;
  String? transactionsSettledAt;
  dynamic transactionsTx;
  dynamic transactionsStatus;
  dynamic transactionsAmount;
  String? paymentMethod;
  String? updatedAt;
  int? fee;
  String? tipStatus;

  Data(
      {this.id,
        this.userId,
        this.amount,
        this.orderId,
        this.currency,
        this.description,
        this.successUrl,
        this.sourceFiatValue,
        this.fiatValue,
        this.autoSettle,
        this.notifEmail,
        this.metadata,
        this.uri,
        this.ttl,
        this.lightningInvoicePayReq,
        this.transactionId,
        this.lightningInvoiceExpiresAt,
        this.status,
        this.createdAt,
        this.transactionsCreatedAt,
        this.transactionsSettledAt,
        this.transactionsTx,
        this.transactionsStatus,
        this.transactionsAmount,
        this.paymentMethod,
        this.updatedAt,
        this.fee,
        this.tipStatus});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    amount = json['amount'];
    orderId = json['order_id'];
    currency = json['currency'];
    description = json['description'];
    successUrl = json['success_url'];
    sourceFiatValue = json['source_fiat_value'];
    fiatValue = json['fiat_value'];
    autoSettle = json['auto_settle'];
    notifEmail = json['notif_email'];
    metadata = json['metadata'];
    uri = json['uri'];
    ttl = json['ttl'];
    lightningInvoicePayReq = json['lightning_invoice_pay_req'];
    transactionId = json['transaction_id'];
    lightningInvoiceExpiresAt = json['lightning_invoice_expires_at'];
    status = json['status'];
    createdAt = json['created_at'];
    transactionsCreatedAt = json['transactions_created_at'];
    transactionsSettledAt = json['transactions_settled_at'];
    transactionsTx = json['transactions_tx'];
    transactionsStatus = json['transactions_status'];
    transactionsAmount = json['transactions_amount'];
    paymentMethod = json['payment_method'];
    updatedAt = json['updated_at'];
    fee = json['fee'];
    tipStatus = json['tip_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['amount'] = this.amount;
    data['order_id'] = this.orderId;
    data['currency'] = this.currency;
    data['description'] = this.description;
    data['success_url'] = this.successUrl;
    data['source_fiat_value'] = this.sourceFiatValue;
    data['fiat_value'] = this.fiatValue;
    data['auto_settle'] = this.autoSettle;
    data['notif_email'] = this.notifEmail;
    data['metadata'] = this.metadata;
    data['uri'] = this.uri;
    data['ttl'] = this.ttl;
    data['lightning_invoice_pay_req'] = this.lightningInvoicePayReq;
    data['transaction_id'] = this.transactionId;
    data['lightning_invoice_expires_at'] = this.lightningInvoiceExpiresAt;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['transactions_created_at'] = this.transactionsCreatedAt;
    data['transactions_settled_at'] = this.transactionsSettledAt;
    data['transactions_tx'] = this.transactionsTx;
    data['transactions_status'] = this.transactionsStatus;
    data['transactions_amount'] = this.transactionsAmount;
    data['payment_method'] = this.paymentMethod;
    data['updated_at'] = this.updatedAt;
    data['fee'] = this.fee;
    data['tip_status'] = this.tipStatus;
    return data;
  }
}
