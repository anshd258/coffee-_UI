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
        orderProducts!.add(CartModal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phoneNumber'] = phoneNumber;
    data['name'] = name;
    if (orderProducts != null) {
      data['orderProducts'] = orderProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
