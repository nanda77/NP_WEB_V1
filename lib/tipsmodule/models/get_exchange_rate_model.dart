class GetExchangeRateModel {
  bool? status;
  Data? data;
  String? message;

  GetExchangeRateModel({this.status, this.data, this.message});

  GetExchangeRateModel.fromJson(Map<String, dynamic> json) {
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
  dynamic data;

  Data({this.data});

  Data.fromJson(Map<String, dynamic> json) {
    data = json;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}
