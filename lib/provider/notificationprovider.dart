import 'package:flutter/material.dart';
import '../models/notificationmodal.dart';

class NotificationProvider with ChangeNotifier {
  List<NotificationModal> notifications = [
    NotificationModal(
        id: 1,
        image: "assets/coffee1.png",
        name: "Latte",
        orderstate:
            Orderstate(canclled: true, completed: false, inprocess: false),
        date: "2018-12-10T13:45:00.000Z"),
    NotificationModal(
        id: 1,
        image: "assets/coffee1.png",
        name: "Latte",
        orderstate:
            Orderstate(canclled: false, completed: true, inprocess: false),
        date: "2018-12-10T13:45:00.000Z"),
    NotificationModal(
        id: 1,
        image: "assets/coffee1.png",
        name: "Latte",
        orderstate:
            Orderstate(canclled: false, completed: false, inprocess: true),
        date: "2018-12-10T13:45:00.000Z"),
    NotificationModal(
        id: 1,
        image: "assets/coffee1.png",
        name: "Latte",
        orderstate:
            Orderstate(canclled: false, completed: true, inprocess: false),
        date: "2018-12-10T13:45:00.000Z"),
    NotificationModal(
        id: 1,
        image: "assets/coffee1.png",
        name: "Latte",
        orderstate:
            Orderstate(canclled: false, completed: true, inprocess: false),
        date: "2018-12-10T13:45:00.000Z"),
    NotificationModal(
        id: 1,
        image: "assets/coffee1.png",
        name: "Latte",
        orderstate:
            Orderstate(canclled: false, completed: true, inprocess: false),
        date: "2018-12-10T13:45:00.000Z"),
    NotificationModal(
        id: 1,
        image: "assets/coffee1.png",
        name: "Latte",
        orderstate:
            Orderstate(canclled: false, completed: true, inprocess: false),
        date: "2018-12-10T13:45:00.000Z"),
    NotificationModal(
        id: 1,
        image: "assets/coffee1.png",
        name: "Latte",
        orderstate:
            Orderstate(canclled: false, completed: true, inprocess: false),
        date: "2018-12-10T13:45:00.000Z")
  ];
}
