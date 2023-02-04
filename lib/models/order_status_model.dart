class OrderStatus {
  String? message;
  Data? data;

  OrderStatus({this.message, this.data});

  OrderStatus.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? orderState;
  String? estTime;

  Data({this.orderState, this.estTime});

  Data.fromJson(Map<String, dynamic> json) {
    orderState = json['orderState'];
    estTime = json['estTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderState'] = orderState;
    data['estTime'] = estTime;
    return data;
  }
}
