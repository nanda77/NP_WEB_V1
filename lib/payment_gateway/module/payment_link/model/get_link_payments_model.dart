class GetLinkPaymentsModel {
  GetLinkPaymentsModel({
      this.status, 
      this.next, 
      this.data, 
      this.message,});

  GetLinkPaymentsModel.fromJson(dynamic json) {
    status = json['status'];
    next = json['next'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(LinkPaymentData.fromJson(v));
      });
    }
    message = json['message'];
  }
  bool? status;
  bool? next;
  List<LinkPaymentData>? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['next'] = next;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    return map;
  }

}

class LinkPaymentData {
  LinkPaymentData({
      this.linkId, 
      this.amount, 
      this.purpose, 
      this.customPaylink, 
      this.createdAt, 
      this.updatedAt,});

  LinkPaymentData.fromJson(dynamic json) {
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