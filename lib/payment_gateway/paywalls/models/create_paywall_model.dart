class CreatePaywallModel {
  Data? data;

  CreatePaywallModel({this.data});

  CreatePaywallModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? wallet;
  String? url;
  String? memo;
  String? description;
  int? amount;
  int? time;
  bool? remembers;
  dynamic extras;

  Data(
      {this.id,
        this.wallet,
        this.url,
        this.memo,
        this.description,
        this.amount,
        this.time,
        this.remembers,
        this.extras});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    wallet = json['wallet'];
    url = json['url'];
    memo = json['memo'];
    description = json['description'];
    amount = json['amount'];
    time = json['time'];
    remembers = json['remembers'];
    extras = json['extras'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['wallet'] = this.wallet;
    data['url'] = this.url;
    data['memo'] = this.memo;
    data['description'] = this.description;
    data['amount'] = this.amount;
    data['time'] = this.time;
    data['remembers'] = this.remembers;
    data['extras'] = this.extras;
    return data;
  }
}
