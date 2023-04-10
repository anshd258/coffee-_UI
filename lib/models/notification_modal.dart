class NotificatonModal {
  String? orderNo;
  String? title;
  String? body;
  bool? readReceipt;

  NotificatonModal({this.orderNo, this.title, this.body, this.readReceipt});

  NotificatonModal.fromJson(Map<String, dynamic> json) {
    orderNo = json['orderNo'] ?? "";
    title = json['title'];
    body = json['body'];
    readReceipt = json['readReceipt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderNo'] = orderNo;
    data['title'] = title;
    data['body'] = body;
    data['readReceipt'] = readReceipt;
    return data;
  }
}
