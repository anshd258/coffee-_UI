import 'dart:convert';

import 'package:inter_coffee/provider/loginhandler/login_functions.dart';

import '../constants/authconst.dart';
import '../models/products_list_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductsProvider with ChangeNotifier {
  List<ProductList> products = [];
  List<ProductList> serchable = [];
  List<ProductList> get productslist {
    return serchable;
  }

  Future<String> getproducts() async {
    final data = loginhandler().getData();
    final accessTokken = data!.token;

    print(" new access tokken $accessTokken");
    const url = "$baseurl/getProductList";
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessTokken',
    });
    if (response.statusCode != 200) {
      return "token expired";
    }
    final responseData = json.decode(response.body);

    final List<ProductList> loadedorders = [];
    final loadData = responseData['data'] as List<dynamic>;

    for (var element in loadData) {
      final data = element as Map<String, dynamic>;

      loadedorders.add(ProductList.fromJson(data));
    }

    products = loadedorders;
    serchable = products;
    notifyListeners();
    return "working";
  }

  void searchData(String info) {
    print(info);
    var data = products.where(
        (element) => element.name!.toUpperCase().contains(info.toUpperCase()));
    serchable = data.toList();
    notifyListeners();
  }
}
