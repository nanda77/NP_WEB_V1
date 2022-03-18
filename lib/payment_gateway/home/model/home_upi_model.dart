class HomeUpiModel {
  bool? status;
  Data? data;
  String? message;

  HomeUpiModel({this.status, this.data, this.message});

  HomeUpiModel.fromJson(Map<String, dynamic> json) {
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
  MerchantDetails? merchantDetails;
  BalanceStatus? balanceStatus;
  List<String>? transactionRecords;

  Data({this.merchantDetails, this.balanceStatus, this.transactionRecords});

  Data.fromJson(Map<String, dynamic> json) {
    merchantDetails = json['merchant_details'] != null
        ? new MerchantDetails.fromJson(json['merchant_details'])
        : null;
    balanceStatus = json['balance_status'] != null
        ? new BalanceStatus.fromJson(json['balance_status'])
        : null;
    transactionRecords = json['transaction_records'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.merchantDetails != null) {
      data['merchant_details'] = this.merchantDetails!.toJson();
    }
    if (this.balanceStatus != null) {
      data['balance_status'] = this.balanceStatus!.toJson();
    }
    data['transaction_records'] = this.transactionRecords;
    return data;
  }
}

class MerchantDetails {
  String? fullName;
  String? image;
  String? username;
  String? upi;
  bool? isVerified;
  bool? upiEnabled;

  MerchantDetails(
      {this.fullName,
        this.image,
        this.username,
        this.upi,
        this.isVerified,
        this.upiEnabled});

  MerchantDetails.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    image = json['image'];
    username = json['username'];
    upi = json['upi'];
    isVerified = json['is_verified'];
    upiEnabled = json['upi_enabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['image'] = this.image;
    data['username'] = this.username;
    data['upi'] = this.upi;
    data['is_verified'] = this.isVerified;
    data['upi_enabled'] = this.upiEnabled;
    return data;
  }
}

class BalanceStatus {
  int? pending;
  int? approved;
  int? declined;

  BalanceStatus({this.pending, this.approved, this.declined});

  BalanceStatus.fromJson(Map<String, dynamic> json) {
    pending = json['pending'];
    approved = json['approved'];
    declined = json['declined'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pending'] = this.pending;
    data['approved'] = this.approved;
    data['declined'] = this.declined;
    return data;
  }
}
