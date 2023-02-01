class ProductList {
  String? id;
  String? name;
  String? img;
  String? description;
  Choice? choice;

  ProductList({this.id, this.name, this.img, this.description, this.choice});

  ProductList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    description = json['description'];
    choice =
        json['choice'] != null ? new Choice.fromJson(json['choice']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img'] = this.img;
    data['description'] = this.description;
    if (this.choice != null) {
      data['choice'] = this.choice!.toJson();
    }
    return data;
  }
}

class Choice {
  Syrups? syrups;
  Syrups? cupFilling;
  Syrups? sugarLevels;
  Syrups? milkCategories;

  Choice({this.syrups, this.cupFilling, this.sugarLevels, this.milkCategories});

  Choice.fromJson(Map<String, dynamic> json) {
    syrups =
        json['syrups'] != null ? new Syrups.fromJson(json['syrups']) : null;
    cupFilling = json['cup_filling'] != null
        ? new Syrups.fromJson(json['cup_filling'])
        : null;
    sugarLevels = json['sugar_levels'] != null
        ? new Syrups.fromJson(json['sugar_levels'])
        : null;
    milkCategories = json['milk_categories'] != null
        ? new Syrups.fromJson(json['milk_categories'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.syrups != null) {
      data['syrups'] = this.syrups!.toJson();
    }
    if (this.cupFilling != null) {
      data['cup_filling'] = this.cupFilling!.toJson();
    }
    if (this.sugarLevels != null) {
      data['sugar_levels'] = this.sugarLevels!.toJson();
    }
    if (this.milkCategories != null) {
      data['milk_categories'] = this.milkCategories!.toJson();
    }
    return data;
  }
}

class Syrups {
  String? type;
  List<String>? choice;

  Syrups({this.type, this.choice});

  Syrups.fromJson(Map<String, dynamic> json) {
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
