class TransactionStatusModel {
  bool? status;
  Data? data;
  String? message;

  TransactionStatusModel({this.status, this.data, this.message});

  TransactionStatusModel.fromJson(Map<String, dynamic> json) {
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
  String? status;
  String? transactionId;

  Data({this.status, this.transactionId});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    transactionId = json['transaction_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['transaction_id'] = this.transactionId;
    return data;
  }
}
