class OrderStatus {
  String? message;
  Data? data;

  OrderStatus({this.message, this.data});

  OrderStatus.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderState'] = this.orderState;
    data['estTime'] = this.estTime;
    return data;
  }
}
