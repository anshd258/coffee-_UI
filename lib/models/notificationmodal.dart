class NotificatonModal {
  String? orderId;
  String? title;
  String? body;
  bool? readReceipt;

  NotificatonModal({this.orderId, this.title, this.body, this.readReceipt});

  NotificatonModal.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'] ?? "";
    title = json['title'];
    body = json['body'];
    readReceipt = json['readReceipt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['title'] = this.title;
    data['body'] = this.body;
    data['readReceipt'] = this.readReceipt;
    return data;
  }
}
