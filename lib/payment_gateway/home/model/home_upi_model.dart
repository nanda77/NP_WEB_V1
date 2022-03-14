class HomeUpiModel {
  HomeUpiModel({
    this.status,
    this.data,
    this.message,
  });

  HomeUpiModel.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  bool? status;
  Data? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    return map;
  }
}

class Data {
  Data({
    this.merchantDetails,
    this.balanceStatus,
    this.transactionRecords,
  });

  Data.fromJson(dynamic json) {
    merchantDetails = json['merchant_details'] != null
        ? Merchant_details.fromJson(json['merchantDetails'])
        : null;
    balanceStatus = json['balance_status'] != null
        ? Balance_status.fromJson(json['balanceStatus'])
        : null;
    if (json['transaction_records'] != null) {
      transactionRecords = [];
      json['transaction_records'].forEach((v) {
        transactionRecords?.add(Transaction_records.fromJson(v));
      });
    }
  }

  Merchant_details? merchantDetails;
  Balance_status? balanceStatus;
  List<Transaction_records>? transactionRecords;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (merchantDetails != null) {
      map['merchant_details'] = merchantDetails?.toJson();
    }
    if (balanceStatus != null) {
      map['balance_status'] = balanceStatus?.toJson();
    }
    if (transactionRecords != null) {
      map['transaction_records'] =
          transactionRecords?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}


class Transaction_records {
  Transaction_records({
    this.linkId,
    this.amount,
    this.purpose,
    this.customPaylink,
    this.createdAt,
    this.updatedAt,
  });

  Transaction_records.fromJson(dynamic json) {
    linkId = json['link_id'];
    amount = json['amount'];
    purpose = json['purpose'];
    customPaylink = json['custom_paylink'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  String? linkId;
  int? amount;
  String? purpose;
  String? customPaylink;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['link_id'] = linkId;
    map['amount'] = amount;
    map['purpose'] = purpose;
    map['custom_paylink'] = customPaylink;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

/// pending : 0
/// approved : 0
/// declined : 0

class Balance_status {
  Balance_status({
    this.pending,
    this.approved,
    this.declined,
  });

  Balance_status.fromJson(dynamic json) {
    pending = json['pending'];
    approved = json['approved'];
    declined = json['declined'];
  }

  int? pending;
  int? approved;
  int? declined;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pending'] = pending;
    map['approved'] = approved;
    map['declined'] = declined;
    return map;
  }
}

class Merchant_details {
  Merchant_details({
    this.fullName,
    this.image,
    this.username,
    this.isVerified,
    this.upiEnabled,
  });

  Merchant_details.fromJson(dynamic json) {
    fullName = json['full_name'];
    image = json['image'];
    username = json['username'];
    isVerified = json['is_verified'];
    upiEnabled = json['upi_enabled'];
  }

  String? fullName;
  String? image;
  String? username;
  bool? isVerified;
  bool? upiEnabled;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['full_name'] = fullName;
    map['image'] = image;
    map['username'] = username;
    map['is_verified'] = isVerified;
    map['upi_enabled'] = upiEnabled;
    return map;
  }
}
