class NotificationModal {
  int? id;
  String? image;
  String? name;
  Orderstate? orderstate;
  String? date;

  NotificationModal(
      {required this.id,
      required this.image,
      required this.name,
      required this.orderstate,
      required this.date});

  NotificationModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json["image"];
    orderstate = json['orderstate'] != null
        ? Orderstate.fromJson(json['orderstate'])
        : null;
    date = json['date'];
  }
}

class Orderstate {
  bool completed = false;
  bool inprocess = false;
  bool canclled = false;

  Orderstate(
      {required this.completed,
      required this.inprocess,
      required this.canclled});

  Orderstate.fromJson(Map<String, dynamic> json) {
    completed = json['completed'];
    inprocess = json['inprocess'];
    canclled = json['canclled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['completed'] = completed;
    data['inprocess'] = inprocess;
    data['canclled'] = canclled;
    return data;
  }
}
