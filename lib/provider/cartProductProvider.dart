import 'package:flutter/material.dart';
import 'package:inter_coffee/models/order_prouct.dart';
import 'package:inter_coffee/provider/authconst.dart';
import 'package:inter_coffee/provider/loginhandler/loginsharedpref.dart';

class CartProductsProvider with ChangeNotifier {
  List<CartModal> cartData = [];
  CartModal currentproduct = CartModal();
  List<Choice> currentChoie = [];

  Future<void> postData() async {
    final accessTokken = await getToken();
    print(" new access tokken $accessTokken");
    final url = "$baseurl/placeOrder";
    List<Map<String, dynamic>> currentData = [];
    cartData.forEach((element) {
      currentData.add(element.toJson());
    });
  }

  void submit() {
    cartData.add(currentproduct);
    cartData.forEach((element) {
      print(element.toJson());
    });
  }

  void setCartData() {
    currentproduct.choice = currentChoie;
    notifyListeners();
  }

  void choiceSetter(Choice data) {
    currentChoie.add(data);

    notifyListeners();
  }

  void currentsession() {
    currentChoie = [];
    currentproduct = CartModal();
    notifyListeners();
  }

  void removeProduct(CartModal data) {
    cartData.remove(data);
    print(cartData.length);
    notifyListeners();
  }

  void clearCart() {
    cartData.clear();
    notifyListeners();
  }
}
