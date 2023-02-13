import 'package:flutter/material.dart';
import 'package:inter_coffee/models/add_product_to_cart.dart';

class CartProductsProvider with ChangeNotifier {
  List<AddProductToCart> cartData = [];
  AddProductToCart currentproduct = AddProductToCart();

  void addingProductsToCart() {
    cartData.add(currentproduct);
    print(cartData.length);
    notifyListeners();
  }

  void clearCurrentProduct() {
    currentproduct = AddProductToCart();
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
    print("This is Assignment of Value -> ${currentproduct.choiceOfCupFilling}");
  }

  void updateChoiceOfMilk(String name) {
    currentproduct.choiceOfMilk = name;
    print("This is Assignment of Value -> ${currentproduct.choiceOfMilk}");
  }

  void updateChoiceOfSugar(String name) {
    currentproduct.choiceOfSugar = name;
    print("This is Assignment of Value -> ${currentproduct.choiceOfSugar}");
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
