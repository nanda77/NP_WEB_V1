class PaywallListModel {
  List<Data>? data;

  PaywallListModel({this.data});

  PaywallListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
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
