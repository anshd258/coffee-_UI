import 'dart:convert';
import 'authconst.dart';
import './loginAuthProvider.dart';
import '../models/products_list_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductsProvider with ChangeNotifier {
  List<ProductList> products = [];
  List<ProductList> get productslist {
    return products;
  }

 
  Future<void> getproducts() async {
    const url = "https://swift-cafe-dev.swifttrackmile.codes/getProductList";
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken',
    });
    final responseData = json.decode(response.body) as List<dynamic>;
    final List<ProductList> loadedorders = [];

    responseData.forEach((element) {
      final data = element as Map<String, dynamic>;

      loadedorders.add(ProductList.fromJson(data));
    });
    print(loadedorders.first.choice.toString());
    products = loadedorders;
    notifyListeners();
  }
}
