class orderProduct {
  List<OrderProducts>? orderProducts;

  orderProduct({this.orderProducts});

  orderProduct.fromJson(Map<String, dynamic> json) {
    if (json['orderProducts'] != null) {
      orderProducts = <OrderProducts>[];
      json['orderProducts'].forEach((v) {
        orderProducts!.add(new OrderProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderProducts != null) {
      data['orderProducts'] =
          this.orderProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderProducts {
  String? productId;
  int? quantity;
  Choice? choice;

  OrderProducts({this.productId, this.quantity, this.choice});

  OrderProducts.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    quantity = json['quantity'];
    choice =
        json['choice'] != null ? new Choice.fromJson(json['choice']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    if (this.choice != null) {
      data['choice'] = this.choice!.toJson();
    }
    return data;
  }
}

class Choice {
  CupFilling? cupFilling;
  CupFilling? milkCategories;
  CupFilling? syrups;
  CupFilling? sugarLevels;

  Choice({this.cupFilling, this.milkCategories, this.syrups, this.sugarLevels});

  Choice.fromJson(Map<String, dynamic> json) {
    cupFilling = json['cup_filling'] != null
        ? new CupFilling.fromJson(json['cup_filling'])
        : null;
    milkCategories = json['milk_categories'] != null
        ? new CupFilling.fromJson(json['milk_categories'])
        : null;
    syrups =
        json['syrups'] != null ? new CupFilling.fromJson(json['syrups']) : null;
    sugarLevels = json['sugar_levels'] != null
        ? new CupFilling.fromJson(json['sugar_levels'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cupFilling != null) {
      data['cup_filling'] = this.cupFilling!.toJson();
    }
    if (this.milkCategories != null) {
      data['milk_categories'] = this.milkCategories!.toJson();
    }
    if (this.syrups != null) {
      data['syrups'] = this.syrups!.toJson();
    }
    if (this.sugarLevels != null) {
      data['sugar_levels'] = this.sugarLevels!.toJson();
    }
    return data;
  }
}

class CupFilling {
  String? type;
  List<String>? choice;

  CupFilling({this.type, this.choice});

  CupFilling.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    choice = json['choice'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['choice'] = this.choice;
    return data;
  }
}