class CartProductsModal {
  String? id;
  String? name;
  String? ratings;
  String? numberOfReviews;
  String? discription;
  String? imageUrl;
  String? price;
  String? quantity;
  String? choiceOfCupFilling;
  String? choiceOfMilk;
  String? choiceOfSuger;

  CartProductsModal(
      {this.id,
      this.name,
      this.ratings,
      this.numberOfReviews,
      this.discription,
      this.imageUrl,
      this.price,
      this.quantity,
      this.choiceOfCupFilling,
      this.choiceOfMilk,
      this.choiceOfSuger});

  // CartPrdouctsModal.fromJson(Map<String, dynamic> json) {
  //   name = json['name'];
  //   ratings = json['ratings'];
  //   numberOfReviews = json['numberOfReviews'];
  //   discription = json['discription'];
  //   imageUrl = json['imageUrl'];
  //   price = json['price'];
  //   quantity = json['quantity'];
  //   choiceOfCupFilling = json['Choice_of_cup_filling'];
  //   choiceOfMilk = json['Choice_of_milk'];
  //   choiceOfSuger = json['Choice_of_suger'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['ratings'] = this.ratings;
    data['numberOfReviews'] = this.numberOfReviews;
    data['discription'] = this.discription;
    data['imageUrl'] = this.imageUrl;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['Choice_of_cup_filling'] = this.choiceOfCupFilling;
    data['Choice_of_milk'] = this.choiceOfMilk;
    data['Choice_of_suger'] = this.choiceOfSuger;
    return data;
  }
}
