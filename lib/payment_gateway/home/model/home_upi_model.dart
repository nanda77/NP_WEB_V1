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
  List<TransactionRecords>? transactionRecords;

  Data({this.merchantDetails, this.balanceStatus, this.transactionRecords});

  Data.fromJson(Map<String, dynamic> json) {
    merchantDetails = json['merchant_details'] != null
        ? new MerchantDetails.fromJson(json['merchant_details'])
        : null;
    balanceStatus = json['balance_status'] != null
        ? new BalanceStatus.fromJson(json['balance_status'])
        : null;
    if (json['transaction_records'] != null) {
      transactionRecords = <TransactionRecords>[];
      json['transaction_records'].forEach((v) {
        transactionRecords!.add(new TransactionRecords.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.merchantDetails != null) {
      data['merchant_details'] = this.merchantDetails!.toJson();
    }
    if (this.balanceStatus != null) {
      data['balance_status'] = this.balanceStatus!.toJson();
    }
    if (this.transactionRecords != null) {
      data['transaction_records'] = this.transactionRecords!.map((v) => v.toJson()).toList();
    }
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

class TransactionRecords {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? utr;
  int? price;
  String? upi;
  String? purpose;
  String? orderId;
  String? status;
  String? emailPhone;

  TransactionRecords(
      {this.id,
        this.createdAt,
        this.updatedAt,
        this.utr,
        this.price,
        this.upi,
        this.purpose,
        this.orderId,
        this.status,
        this.emailPhone});

  TransactionRecords.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    utr = json['utr'];
    price = json['price'];
    upi = json['upi'];
    purpose = json['purpose'];
    orderId = json['order_id'];
    status = json['status'];
    emailPhone = json['email_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['utr'] = this.utr;
    data['price'] = this.price;
    data['upi'] = this.upi;
    data['purpose'] = this.purpose;
    data['order_id'] = this.orderId;
    data['status'] = this.status;
    data['email_phone'] = this.emailPhone;
    return data;
  }
}
