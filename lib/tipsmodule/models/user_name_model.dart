class UserNameModel {
  bool? status;
  UserData? data;
  String? message;

  UserNameModel({this.status, this.data, this.message});

  UserNameModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new UserData.fromJson(json['data']) : null;
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

class UserData {
  String? username;
  String? country;
  String? image;
  bool? isVerified;
  String? currencyType;
  String? fullName;
  bool? upiEnabled;
  String? btcUnit;
  String? upi;

  UserData({this.username,
        this.country,
        this.image,
        this.isVerified,
        this.currencyType,
        this.fullName,
        this.upiEnabled,
        this.btcUnit,
        this.upi});

  UserData.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    country = json['country'];
    image = json['image'];
    isVerified = json['is_verified'];
    currencyType = json['currency_type'];
    fullName = json['full_name'];
    upiEnabled = json['upi_enabled'];
    btcUnit = json['btc_unit'];
    upi = json['upi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['country'] = this.country;
    data['image'] = this.image;
    data['is_verified'] = this.isVerified;
    data['currency_type'] = this.currencyType;
    data['full_name'] = this.fullName;
    data['upi_enabled'] = this.upiEnabled;
    data['btc_unit'] = this.btcUnit;
    data['upi'] = this.upi;
    return data;
  }
}
