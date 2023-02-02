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
      "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIrOTE3OTgyNDkxMjYyIiwiaXNVc2VyIjp0cnVlLCJleHAiOjE2NzUzNjg4NzQsInVzZXJJZCI6IjRlMjUzNjBlLTk2N2QtNDViZS05MWNiLTVlYThmNDlmZDIyMiIsImlhdCI6MTY3NTM1MDg3NH0.3Xfc4LFvaXPQ1teSX9fZmR69MAFAVW4mFFSEzVvsReKOs_HxEkVxmamDaUV_CGpHGLHnS9GscZaB1wPQ14WrSg";
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
