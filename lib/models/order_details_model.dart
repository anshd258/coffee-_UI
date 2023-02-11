class OrderDetails {
  String? orderId;
  String? orderNo;
  UserId? userId;
  String? createdDate;
  String? currentState;
  String? nextStateEstTime;
  bool? priority;

  OrderDetails(
      {this.orderId,
      this.orderNo,
      this.userId,
      this.createdDate,
      this.currentState,
      this.nextStateEstTime,
      this.priority});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    if (json['orderNo'] == null) {
      orderNo = json['orderId'];
    } else {
      orderNo = json['orderNo'];
    }
    userId = json['userId'] != null ? UserId.fromJson(json['userId']) : null;
    createdDate = json['createdDate'];
    currentState = json['currentState'];
    nextStateEstTime = json['next_state_est_time'];
    priority = json['priority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderId'] = orderId;
    data['orderNo'] = orderNo;
    if (userId != null) {
      data['userId'] = userId!.toJson();
    }
    data['createdDate'] = createdDate;
    data['currentState'] = currentState;
    data['next_state_est_time'] = nextStateEstTime;
    data['priority'] = priority;
    return data;
  }
}

class UserId {
  String? id;
  String? phoneNo;
  String? name;
  String? email;

  UserId({this.id, this.phoneNo, this.name});

  UserId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNo = json['phoneNo'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['phoneNo'] = phoneNo;
    data['name'] = name;
    return data;
  }
}
