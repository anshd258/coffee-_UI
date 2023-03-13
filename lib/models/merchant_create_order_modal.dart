

import 'package:inter_coffee/models/order_prouct.dart';

class MerchantCreateOrder {
  String? phoneNumber;
  String? name;
  List<CartModal>? orderProducts;

  MerchantCreateOrder({this.phoneNumber, this.name, this.orderProducts});

  MerchantCreateOrder.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
    name = json['name'];
    if (json['orderProducts'] != null) {
      orderProducts = <CartModal>[];
      json['orderProducts'].forEach((v) {
        orderProducts!.add(new CartModal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phoneNumber'] = this.phoneNumber;
    data['name'] = this.name;
    if (this.orderProducts != null) {
      data['orderProducts'] =
          this.orderProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

