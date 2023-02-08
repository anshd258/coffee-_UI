class ProductList {
  String? id;
  String? name;
  String? img;
  String? description;
  List<Syrups>? choice;

  ProductList({this.id, this.name, this.img, this.description, this.choice});

  ProductList.fromJson(Map<String, dynamic> json) {
    id = json['productId'];
    name = json['productName'];
    img = json['productImgLink'];
    description = json['desc'];

    List<dynamic>? loadedChoice = json['choices'] as List<dynamic>;
    if (loadedChoice != null) {
      List<Syrups> loadedchoicesdata = [];
      // print(choicedata);
      loadedChoice.forEach((element) {
        final data = element as Map<String, dynamic>;

        loadedchoicesdata.add(Syrups.fromJson(data));
      });
      choice = loadedchoicesdata;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['img'] = img;
    data['description'] = description;
    if (choice != null) {
      data['choice'] = choice!.toString();
    }
    return data;
  }
}

class Syrups {
  String? name;
  String? type;
  List<dynamic>? choice;

  Syrups({this.type, this.choice, this.name});

  Syrups.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    print(name);
    type = json['type'];
    print(type);
    choice = json['choice'].cast<String>();
    print(choice);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['type'] = type;
    data['choice'] = choice;
    return data;
  }
}
