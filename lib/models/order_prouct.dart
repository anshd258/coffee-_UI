class CartModal {
  String? productId;
  int? quantity;
  List<Choice>? choice;

  CartModal({this.productId, this.quantity, this.choice});

  CartModal.fromJson(Map<String, dynamic> json) {
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
  String? type;
  List<String>? choice;

  Choice({this.name, this.type, this.choice});

  Choice.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    choice = json['choice'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['type'] = type;
    data['choice'] = choice;
    return data;
  }
}
