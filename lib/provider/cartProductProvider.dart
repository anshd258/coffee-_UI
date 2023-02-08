import 'package:flutter/material.dart';
import '../models/order_prouct.dart';

class CartProductsProvider with ChangeNotifier {
  List<orderProduct> cartData = [];
  
  orderProduct currentproduct = orderProduct();

  void AddingProductsToCart(orderProduct data) {
    cartData.add(data);
    print(cartData.length);
    notifyListeners();
  }

  void removeProduct(orderProduct data) {
    cartData.remove(data);
    print(cartData.length);
    notifyListeners();
  }

  void clearCart() {
    cartData.clear();
    notifyListeners();
  }
}
