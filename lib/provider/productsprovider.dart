import 'dart:convert';
import '../models/products_list_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductsProvider with ChangeNotifier {
  List<ProductList> products = [];
  List<ProductList> get productslist {
    return products;
  }

  final token =
      "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIrOTE3OTgyNDkxMjYyIiwiaXNVc2VyIjp0cnVlLCJleHAiOjE2NzUzMDE2NDksInVzZXJJZCI6IjRlMjUzNjBlLTk2N2QtNDViZS05MWNiLTVlYThmNDlmZDIyMiIsImlhdCI6MTY3NTI4MzY0OX0.9XDdZLxCqDwmUQ8xGNpx4Rp07b098srHUZ1nsV0aZnY76HlMT5QZgmUZeRC8dDKBw5s2ue_3YlEYobeB6WzX4g";
  Future<void> getproducts() async {
    const url = "https://swift-cafe-dev.swifttrackmile.codes/getProductList";
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }).then((value) {
      print(value.body.toString());

      products.add(
          ProductList(description: "235235525", img: "noimage", name: "latte"));
      notifyListeners();
    });
    final responseData = json.decode(response) as List<Map<String, dynamic>>;
    final List<ProductList> loadedorders = [];
    responseData.forEach((element) {
      loadedorders.add(ProductList(
              description: "lorenipsum", img: "good image", name: "Latte")
          // ProductList(
          //   id: element["id"],
          //   description: element["description"],
          //   img: element["img"],
          //   name: element["name"],
          //   choice: Choice(
          //     cupFilling: Syrups(
          //       type: element["choice"]["cupfilling"]["type"],
          //       choice: element["choice"]["cupfilling"]["choice"] as List<String>,
          //     ),
          //     milkCategories: Syrups(
          //         type: element["choice"]["milkcategories"]["type"],
          //         choice: element["choice"]["milkcategories"]["choice"]
          //             as List<String>),
          //     sugarLevels: Syrups(
          //       type: element["choice"]["sugerlevels"]["type"],
          //       choice: element["choice"]["sugerlevels"]["choice"],
          //     ),
          //     syrups: Syrups(
          //       type: element["choice"]["syrups"]["type"],
          //       choice: element["choice"]["syrups"]["choice"],
          //     ),
          //   ),
          // ),
          );
    });
    products = loadedorders;
    notifyListeners();
  }
}
