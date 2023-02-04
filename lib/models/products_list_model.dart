class ProductList {
  String? id;
  String? name;
  String? img;
  String? description;
  List<Syrups>? choice;

  ProductList({this.id, this.name, this.img, this.description, this.choice});

  ProductList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    description = json['description'];
    Map<String, dynamic>? choicedata =
        json['choice'] != null ? json['choice'] as Map<String, dynamic> : null;
    if (choicedata != null) {
      List<Syrups> loadedchoices = [];
      // print(choicedata);
      choicedata.entries.forEach((element) {
        final data = element;

        loadedchoices.add(Syrups(
            name: data.key,
            type: data.value['type'].toString(),
            choice: data.value['choice'] != null
                ? data.value['choice'] as List<dynamic>
                : null));
      });
      print(loadedchoices.first.name);
      print(loadedchoices.first.type);
      print(loadedchoices.first.choice.toString());
      choice = loadedchoices;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img'] = this.img;
    data['description'] = this.description;
    if (this.choice != null) {
      data['choice'] = this.choice!.toString();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['choice'] = this.choice;
    return data;
  }
}
