import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:inter_coffee/models/order_prouct.dart';
import 'package:inter_coffee/provider/authconst.dart';
import 'package:inter_coffee/provider/loginhandler/loginsharedpref.dart';

class CartProductsProvider with ChangeNotifier {
  List<CartModal> cartData = [];
  CartModal currentproduct = CartModal();
  List<Choice> currentChoie = [];

  Future<void> postData() async {
    final accessTokken = await getToken();
    List<Map<String, dynamic>> currentData = [];
    for (var element in cartData) {
      currentData.add(element.toJson());
    }
    print({"orderProducts": currentData});
    const url = "$baseurl/placeOrder";
    final data = json.encode({"orderProducts": currentData});
    final response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $accessTokken',
        },
        body: data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      cartData.clear();
      notifyListeners();
    }

    // print("sending data$currentData");
  }

  void orderAgain(List<CartModal> data) {
    cartData.addAll(data);
    notifyListeners();
  }

  void submit() {
    cartData.add(currentproduct);

    for (var element in cartData) {}
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
