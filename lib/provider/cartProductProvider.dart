import 'package:flutter/material.dart';
import '../models/order_prouct.dart';

class CartProductsProvider with ChangeNotifier {
  List<orderProduct> cartData = [];
  orderProduct currentproduct = orderProduct();

  void AddingProductsToCart(orderProduct data) {
    cartData.add(data);
    print(cartData.toString());
    notifyListeners();
  }
}
