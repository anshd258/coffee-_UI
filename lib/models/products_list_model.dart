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

    List<dynamic>? loadedChoice = json['choices'];
    if (loadedChoice != null) {
      List<Syrups> loadedchoicesdata = [];
      // print(choicedata);
      for (var element in loadedChoice) {
        final data = element as Map<String, dynamic>;

        loadedchoicesdata.add(Syrups.fromJson(data));
      }
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
