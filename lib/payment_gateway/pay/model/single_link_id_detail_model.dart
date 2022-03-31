class SingleLinkIdDetailModel {
  bool? status;
  Data? data;
  String? message;

  SingleLinkIdDetailModel({this.status, this.data, this.message});

  SingleLinkIdDetailModel.fromJson(Map<String, dynamic> json) {
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
  String? fullName;
  String? email;
  String? upi;
  String? phoneNumber;
  String? username;
  String? image;
  String? linkId;
  int? amount;
  String? purpose;
  String? customPaylink;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.fullName,
        this.email,
        this.upi,
        this.phoneNumber,
        this.username,
        this.image,
        this.linkId,
        this.amount,
        this.purpose,
        this.customPaylink,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    email = json['email'];
    upi = json['upi'];
    phoneNumber = json['phone_number'];
    username = json['username'];
    image = json['image'];
    linkId = json['link_id'];
    amount = json['amount'];
    purpose = json['purpose'];
    customPaylink = json['custom_paylink'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['upi'] = this.upi;
    data['phone_number'] = this.phoneNumber;
    data['username'] = this.username;
    data['image'] = this.image;
    data['link_id'] = this.linkId;
    data['amount'] = this.amount;
    data['purpose'] = this.purpose;
    data['custom_paylink'] = this.customPaylink;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
