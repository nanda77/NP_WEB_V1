class ProfileDashboardModel {
  bool? status;
  ProfileDashboardData? data;
  String? message;

  ProfileDashboardModel({this.status, this.data, this.message});

  ProfileDashboardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new ProfileDashboardData.fromJson(json['data']) : null;
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

class ProfileDashboardData {
  int? amount;
  String? lastUpdated;
  double? btc;
  double? usdt;
  String? email;
  String? country;
  String? phoneNumber;
  String? username;
  String? image;
  bool? isVerified;
  dynamic verificationType;
  String? myAddress;
  String? createdAt;
  String? updatedAt;
  String? currencyType;
  String? fullName;
  bool? active;
  bool? isBiometric;
  bool? upiEnabled;
  String? fcmToken;
  String? indKyc;
  dynamic intKyc;
  dynamic btcUnit;
  dynamic theme;
  String? upi;
  String? upiType;
  String? upiPaylink;
  String? usr;
  dynamic walletId;
  dynamic adminKey;
  dynamic invoiceReadKey;
  List<Last3Transaction>? last3Trasaction;

  ProfileDashboardData(
      {this.amount,
        this.lastUpdated,
        this.btc,
        this.usdt,
        this.email,
        this.country,
        this.phoneNumber,
        this.username,
        this.image,
        this.isVerified,
        this.verificationType,
        this.myAddress,
        this.createdAt,
        this.updatedAt,
        this.currencyType,
        this.fullName,
        this.active,
        this.isBiometric,
        this.upiEnabled,
        this.fcmToken,
        this.indKyc,
        this.intKyc,
        this.btcUnit,
        this.theme,
        this.upi,
        this.upiType,
        this.upiPaylink,
        this.usr,
        this.walletId,
        this.adminKey,
        this.invoiceReadKey,
        this.last3Trasaction});

  ProfileDashboardData.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    lastUpdated = json['last_updated'];
    btc = json['btc'];
    usdt = json['usdt'];
    email = json['email'];
    country = json['country'];
    phoneNumber = json['phone_number'];
    username = json['username'];
    image = json['image'];
    isVerified = json['is_verified'];
    verificationType = json['verification_type'];
    myAddress = json['my_address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    currencyType = json['currency_type'];
    fullName = json['full_name'];
    active = json['active'];
    isBiometric = json['is_biometric'];
    upiEnabled = json['upi_enabled'];
    fcmToken = json['fcm_token'];
    indKyc = json['ind_kyc'];
    intKyc = json['int_kyc'];
    btcUnit = json['btc_unit'];
    theme = json['theme'];
    upi = json['upi'];
    upiType = json['upi_type'];
    upiPaylink = json['upi_paylink'];
    usr = json['usr'];
    walletId = json['wallet_id'];
    adminKey = json['admin_key'];
    invoiceReadKey = json['invoice_read_key'];
    if (json['last3Trasaction'] != null) {
      last3Trasaction = <Last3Transaction>[];
      json['last3Trasaction'].forEach((v) {
        last3Trasaction!.add(new Last3Transaction.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['last_updated'] = this.lastUpdated;
    data['btc'] = this.btc;
    data['usdt'] = this.usdt;
    data['email'] = this.email;
    data['country'] = this.country;
    data['phone_number'] = this.phoneNumber;
    data['username'] = this.username;
    data['image'] = this.image;
    data['is_verified'] = this.isVerified;
    data['verification_type'] = this.verificationType;
    data['my_address'] = this.myAddress;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['currency_type'] = this.currencyType;
    data['full_name'] = this.fullName;
    data['active'] = this.active;
    data['is_biometric'] = this.isBiometric;
    data['upi_enabled'] = this.upiEnabled;
    data['fcm_token'] = this.fcmToken;
    data['ind_kyc'] = this.indKyc;
    data['int_kyc'] = this.intKyc;
    data['btc_unit'] = this.btcUnit;
    data['theme'] = this.theme;
    data['upi'] = this.upi;
    data['upi_type'] = this.upiType;
    data['upi_paylink'] = this.upiPaylink;
    data['usr'] = this.usr;
    data['wallet_id'] = this.walletId;
    data['admin_key'] = this.adminKey;
    data['invoice_read_key'] = this.invoiceReadKey;
    if (this.last3Trasaction != null) {
      data['last3Trasaction'] = this.last3Trasaction!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Last3Transaction {
  int? amount;
  String? transactionType;
  String? transactionId;
  String? note;
  String? paymentMethod;
  dynamic senderUid;
  dynamic receiverUid;
  int? fee;
  String? createdAt;
  int? netFiatValue;
  double? fiatValue;
  String? status;
  String? updatedAt;
  String? lightningAddress;
  dynamic lightningInvoiceExpiresAt;
  double? btcPrice;
  String? fiatCurrencyUnit;
  String? unit;
  dynamic tipStatus;
  dynamic fundSource;
  int? gstRate;
  int? tdsRate;
  int? companyFee;
  int? gstAmount;
  int? tdsAmount;
  String? otherParty;
  dynamic onChainAddress;
  dynamic chainInvoiceAddress;

  Last3Transaction(
      {this.amount,
        this.transactionType,
        this.transactionId,
        this.note,
        this.paymentMethod,
        this.senderUid,
        this.receiverUid,
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
        this.unit,
        this.tipStatus,
        this.fundSource,
        this.gstRate,
        this.tdsRate,
        this.companyFee,
        this.gstAmount,
        this.tdsAmount,
        this.otherParty,
        this.onChainAddress,
        this.chainInvoiceAddress});

  Last3Transaction.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    transactionType = json['transaction_type'];
    transactionId = json['transaction_id'];
    note = json['note'];
    paymentMethod = json['payment_method'];
    senderUid = json['sender_uid'];
    receiverUid = json['receiver_uid'];
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
    unit = json['unit'];
    tipStatus = json['tip_status'];
    fundSource = json['fund_source'];
    gstRate = json['gst_rate'];
    tdsRate = json['tds_rate'];
    companyFee = json['company_fee'];
    gstAmount = json['gst_amount'];
    tdsAmount = json['tds_amount'];
    otherParty = json['other_party'];
    onChainAddress = json['on_chain_address'];
    chainInvoiceAddress = json['chain_invoice_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['transaction_type'] = this.transactionType;
    data['transaction_id'] = this.transactionId;
    data['note'] = this.note;
    data['payment_method'] = this.paymentMethod;
    data['sender_uid'] = this.senderUid;
    data['receiver_uid'] = this.receiverUid;
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
    data['unit'] = this.unit;
    data['tip_status'] = this.tipStatus;
    data['fund_source'] = this.fundSource;
    data['gst_rate'] = this.gstRate;
    data['tds_rate'] = this.tdsRate;
    data['company_fee'] = this.companyFee;
    data['gst_amount'] = this.gstAmount;
    data['tds_amount'] = this.tdsAmount;
    data['other_party'] = this.otherParty;
    data['on_chain_address'] = this.onChainAddress;
    data['chain_invoice_address'] = this.chainInvoiceAddress;
    return data;
  }
}