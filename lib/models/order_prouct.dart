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
        choice!.add(Choice.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['quantity'] = quantity;
    if (choice != null) {
      data['choice'] = choice!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['choices'] = choices;
    return data;
  }
}
