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
        ? new Orderstate.fromJson(json['orderstate'])
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['completed'] = this.completed;
    data['inprocess'] = this.inprocess;
    data['canclled'] = this.canclled;
    return data;
  }
}
