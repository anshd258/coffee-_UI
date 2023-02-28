class OrderDetails {
  String? orderId;
  String? orderNo;
  List<String>? items;
  UserId? userId;
  String? createdDate;
  String? currentState;
  String? nextStateEstTime;
  bool? priority;

  OrderDetails(
      {this.orderId,
      this.orderNo,
      this.items,
      this.userId,
      this.createdDate,
      this.currentState,
      this.nextStateEstTime,
      this.priority});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    orderNo = json['orderNo'];
    items = json['items'].cast<String>();
    userId =
        json['userId'] != null ? new UserId.fromJson(json['userId']) : null;
    createdDate = json['createdDate'];
    currentState = json['currentState'];
    nextStateEstTime = json['next_state_est_time'];
    priority = json['priority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['orderNo'] = this.orderNo;
    data['items'] = this.items;
    if (this.userId != null) {
      data['userId'] = this.userId!.toJson();
    }
    data['createdDate'] = this.createdDate;
    data['currentState'] = this.currentState;
    data['next_state_est_time'] = this.nextStateEstTime;
    data['priority'] = this.priority;
    return data;
  }
}

class UserId {
  String? id;
  String? phoneNo;
  String? name;
  String? email;

  UserId({this.id, this.phoneNo, this.name, this.email});

  UserId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNo = json['phoneNo'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phoneNo'] = this.phoneNo;
    data['name'] = this.name;
    data['email'] = this.email;

    return data;
  }
}
