import 'package:flutter/material.dart';
import 'package:inter_coffee/models/add_product_to_cart.dart';

AddProductToCart currentproduct = AddProductToCart();
class CartProductsProvider with ChangeNotifier {
  List<AddProductToCart> cartData = [];

  void addingProductsToCart(AddProductToCart data) {
    cartData.add(data);
    print(cartData.length);
    notifyListeners();
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
