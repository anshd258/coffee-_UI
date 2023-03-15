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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderId'] = orderId;
    data['title'] = title;
    data['body'] = body;
    data['readReceipt'] = readReceipt;
    return data;
  }
}
