class Products {
  String? id;
  String? name;
  String? ratings;
  String? numberOfReviews;
  String? discription;
  String? imageUrl;
  String? price;

  Products(
      {this.id,
      this.name,
      this.ratings,
      this.numberOfReviews,
      this.discription,
      this.imageUrl,
      this.price});

  Products.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json['name'];
    ratings = json['ratings'];
    numberOfReviews = json['numberOfReviews'];
    discription = json['discription'];
    imageUrl = json['imageUrl'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['ratings'] = this.ratings;
    data['numberOfReviews'] = this.numberOfReviews;
    data['discription'] = this.discription;
    data['imageUrl'] = this.imageUrl;
    data['price'] = this.price;
    return data;
  }
}
