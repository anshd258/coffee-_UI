import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:inter_coffee/client/merchant_api_handler.dart';
import 'package:inter_coffee/client/user_api_handler.dart';
import 'package:inter_coffee/models/merchant_create_order_modal.dart';
import 'package:inter_coffee/models/order_prouct.dart';
import 'package:inter_coffee/constants/auth_const.dart';
import 'package:inter_coffee/provider/loginhandler/login_functions.dart';

class CartProductsProvider with ChangeNotifier {
  List<CartModal> cartData = [];
  CartModal currentproduct = CartModal();
  List<Choice> currentChoie = [];
  bool priority = true;
  int checkerLength = 0;

  Future<void> postData(bool isPriority) async {
    final dataa = loginhandler().getData();
    final accessTokken = dataa!.token;
    List<Map<String, dynamic>> currentData = [];
    for (var element in cartData) {
      currentData.add(element.toJson());
    }
    if (isPriority) {
      priority = isPriority;
    }
    const url = "$baseurl/placeOrder";
    Map<String, Object> postingData =
        priorityConverter(isPriority, currentData);
    print(postingData);
    final data = json.encode(postingData);
    final response =
        await UserApiHandler().postApiCall(url, accessTokken, data);
    print(response.statusCode);
    if (response.statusCode == 200) {
      cartData.clear();
      notifyListeners();
    }

    // print("sending data$currentData");
  }

  Map<String, Object> priorityConverter(
      bool isPriority, List<Map<String, dynamic>> currentData) {
    final postingData = isPriority == false
        ? {"orderProducts": currentData}
        : {"is_priority": true, "orderProducts": currentData};
    return postingData;
  }

  void orderAgain(List<CartModal> data) {
    cartData.addAll(data);
    notifyListeners();
  }

  Future<void> merchantPostData(String name, String phoneNumber) async {
    final dataa = loginhandler().getData();
    final accessTokken = dataa!.token;
    final MerchantCreateOrder postingData = MerchantCreateOrder(
        name: name, phoneNumber: phoneNumber, orderProducts: cartData);

    const url = "$baseurl/merchant/placeOrder";

    final data = json.encode(postingData.toJson());
    final response =
        await MerchantApiHandler().postApiCall(url, accessTokken, data);
    if (response.statusCode == 200) {
      cartData.clear();
      notifyListeners();
    }
  }

  void submit() {
    cartData.add(currentproduct);
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
    checkerLength = 0;
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
