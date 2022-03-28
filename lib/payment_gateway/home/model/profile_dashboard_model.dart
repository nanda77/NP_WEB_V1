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
  String? btc;
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
  List<dynamic>? last3Trasaction;

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
    last3Trasaction = json['last3Trasaction'].cast<String>();
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
    data['last3Trasaction'] = this.last3Trasaction;
    return data;
  }
}
