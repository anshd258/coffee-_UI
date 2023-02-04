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
      "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIrOTE3OTgyNDkxMjYyIiwiaXNVc2VyIjp0cnVlLCJleHAiOjE2NzU1MzA3NTYsInVzZXJJZCI6IjRlMjUzNjBlLTk2N2QtNDViZS05MWNiLTVlYThmNDlmZDIyMiIsImlhdCI6MTY3NTUxMjc1Nn0.T7AiFSt5XOCJA8t7MZ2GrgISBV_STNigCuJp_wtQDsjt9vrU0ppOAYlckBO1fvI6UN_b68FsZp7Pr7AkV91BxQ";
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
