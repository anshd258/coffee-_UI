import 'dart:convert';
import './loginAuthProvider.dart';
import '../models/products_list_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductsProvider with ChangeNotifier {
  List<ProductList> products = [];
  List<ProductList> get productslist {
    return products;
  }

  final accessToken =
      "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIrOTE3MDI4MTgwMTU4IiwiaXNVc2VyIjp0cnVlLCJleHAiOjE2NzU0NDc2OTMsInVzZXJJZCI6IjJhMWI2NGY0LWI1NmQtNGUxMC04MGM3LTUwM2ZjNTc1ZjQ4YSIsImlhdCI6MTY3NTQyOTY5M30.YVwm7rQOcHj2dQRiSOwrcrJ-TjLCymFxcKfKaN93Gi0LdbTVdg3PjLy7AY5Aonpixb622_jB-aUs8pSpwBLRYQ";
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
      print(data['id']);
      loadedorders.add(ProductList.fromJson(data));
      print(productslist);
    });
    print(loadedorders);
    products = loadedorders;
    notifyListeners();
  }
}
