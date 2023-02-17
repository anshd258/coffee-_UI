class NotificatonModal {
  String? id;
  String? title;
  String? body;
  bool? readReceipt;

  NotificatonModal({this.id, this.title, this.body, this.readReceipt});

  NotificatonModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    readReceipt = json['readReceipt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['readReceipt'] = this.readReceipt;
    return data;
  }
}
