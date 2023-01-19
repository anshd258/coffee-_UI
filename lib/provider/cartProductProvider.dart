import 'package:flutter/material.dart';
import '../models/cartProductModal.dart';
import '../models/productmodal.dart';

class CartProductsProvider with ChangeNotifier {
  List<CartProductsModal> cartData = [];
  CartProductsModal currentproduct = CartProductsModal();

  void AddingProductsTooCart(CartProductsModal data) {
    cartData.add(data);
    notifyListeners();
  }
}
