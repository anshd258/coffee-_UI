import 'package:flutter/material.dart';
import 'package:inter_coffee/models/add_product_to_cart.dart';

class CartProductsProvider with ChangeNotifier {
  List<AddProductToCart> cartData = [];
  AddProductToCart currentproduct = AddProductToCart(
    quantityOfProduct: 1,
    choiceOfCupFilling: "Full",
    choiceOfMilk: "Skim Milk",
    choiceOfSugar: "2 X Sugar",
    choiceOfSyrup: "Chocolate",
    eta: "5 min",
  );

  void addingProductsToCart(AddProductToCart data) {
    cartData.add(data);
    print(cartData.length);
    notifyListeners();
  }

  void clearCurrentProduct() {
    currentproduct = AddProductToCart(
      quantityOfProduct: 1,
      choiceOfCupFilling: "Full",
      choiceOfMilk: "Skim Milk",
      choiceOfSugar: "2 X Sugar",
      choiceOfSyrup: "Chocolate",
      eta: "5 min",
    );
    notifyListeners();
  }

  void updateName(String name) {
    currentproduct.name = name;
  }

  void updateQuantity(int qty) {
    currentproduct.quantityOfProduct = qty;
  }

  void updateProductId(String name) {
    currentproduct.productId = name;
  }

  void updateImgUrl(String name) {
    currentproduct.imgUrl = name;
  }

  void updateChoiceOfCupFilling(String name) {
    currentproduct.choiceOfCupFilling = name;
  }

  void updateChoiceOfMilk(String name) {
    currentproduct.choiceOfMilk = name;
  }

  void updateChoiceOfSugar(String name) {
    currentproduct.choiceOfSugar = name;
  }

  void updateChoiceOfSyrup(String name) {
    currentproduct.choiceOfSyrup = name;
  }

  void updateETA(String name) {
    currentproduct.eta = name;
  }

  void removeProduct(AddProductToCart data) {
    cartData.remove(data);
    print(cartData.length);
    notifyListeners();
  }

  void clearCart() {
    cartData.clear();
    notifyListeners();
  }
}
