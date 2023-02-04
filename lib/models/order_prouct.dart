class orderProduct {
  String? productId;
  int? quantity;
  List<Choice>? choice;

  orderProduct({this.productId, this.quantity, this.choice});

  orderProduct.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    quantity = json['quantity'];
    if (json['choice'] != null) {
      choice = <Choice>[];
      json['choice'].forEach((v) {
        choice!.add(new Choice.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    if (this.choice != null) {
      data['choice'] = this.choice!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Choice {
  String? name;
  List<String>? choices;

  Choice({this.name, this.choices});

  Choice.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    choices = json['choices'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['choices'] = this.choices;
    return data;
  }
}
