

class Data {
  String? orderId;
  String? orderNo;
  UserId? userId;
  String? createdDate;
  String? currentState;
  String? nextStateEstTime;
  bool? priority;

  Data(
      {this.orderId,
      this.orderNo,
      this.userId,
      this.createdDate,
      this.currentState,
      this.nextStateEstTime,
      this.priority});

  Data.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    orderNo = json['orderNo'];
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

  UserId({this.id, this.phoneNo, this.name});

  UserId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNo = json['phoneNo'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phoneNo'] = this.phoneNo;
    data['name'] = this.name;
    return data;
  }
}
