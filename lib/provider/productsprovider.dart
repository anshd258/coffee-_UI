import 'dart:convert';
import 'authconst.dart';
import './loginAuthProvider.dart';
import '../models/products_list_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'loginhandler/loginsharedpref.dart';

class ProductsProvider with ChangeNotifier {
  List<ProductList> products = [];
  List<ProductList> get productslist {
    return products;
  }

  Future<void> getproducts() async {
    final accessTokken = await getToken();
    print(" new access tokken $accessTokken");
    const url = "https://swift-cafe-dev.swifttrackmile.codes/getProductList";
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessTokken',
    });
    final responseData = json.decode(response.body);
    final List<ProductList> loadedorders = [];
    final loadData = responseData['data'] as List<dynamic>;

    loadData.forEach((element) {
      final data = element as Map<String, dynamic>;

      loadedorders.add(ProductList.fromJson(data));
    });

    products = loadedorders;
    notifyListeners();
  }
}
