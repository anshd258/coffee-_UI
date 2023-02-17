class OrderHistoryModel {
  String? id;
  String? orderNo;
  List<Items>? items;
  String? recipientName;
  String? createdDate;

  OrderHistoryModel(
      {this.id,
      this.orderNo,
      this.items,
      this.recipientName,
      this.createdDate});

  OrderHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNo = json['orderNo'] == null ? "1212" : json['orderNo'];

    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    recipientName = json['recipientName'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['orderNo'] = this.orderNo;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['recipientName'] = this.recipientName;
    data['createdDate'] = this.createdDate;
    return data;
  }
}

class Items {
  String? productName;
  String? productImg;
  int? quantity;
  List<Choice>? choice;

  Items({this.productName, this.productImg, this.quantity, this.choice});

  Items.fromJson(Map<String, dynamic> json) {
    productName = json['productName'];
    productImg = json['productImg'];
    quantity = json['quantity'];
    if ( json['choice'] != null ) {
      choice = <Choice>[];
      json['choice'].forEach((v) {
        choice!.add(Choice.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productName'] = this.productName;
    data['productImg'] = this.productImg;
    data['quantity'] = this.quantity;
    if (this.choice != null) {
      data['choice'] = this.choice!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Choice {
  String? name;
  String? type;
  List<String>? choice;

  Choice({this.name, this.type, this.choice});

  Choice.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    choice = json['choice'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['choice'] = this.choice;
    return data;
  }
}