import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:inter_coffee/client/user_api_handler.dart';

import 'package:inter_coffee/constants/auth_const.dart';
import 'package:inter_coffee/provider/loginhandler/login_functions.dart';

import '../models/notification_modal.dart';

class NotificationProvider with ChangeNotifier {
  List<NotificatonModal>? notificatins;
  bool isloading = false;

  Future<int> fetchNotifications() async {
    notificatins = [];
    notificatins!.clear();
    final data = loginhandler().getData();
    final accessTokken = data!.token;

    const url = "$baseurl/getNotifications";

    isloading = true;
    notifyListeners();

    try {
      final response = await UserApiHandler().getApiCall(url, accessTokken);
      isloading = false;
      notifyListeners();
      if (response.statusCode != 200) {
        throw ("error");
      }
      if (response.statusCode == 200) {
        final loadedData = json.decode(response.body);
        if (loadedData['message'] == 'SUCCESS') {
          converter(loadedData);
        }

        notifyListeners();
      }
      return response.statusCode;
    } on TimeoutException {
      return 500;
    } on SocketException {
      return 500;
    } catch (e) {
      return 500;
    }
  }

  void converter(loadedData) {
    final loadNotification = loadedData['data'] as List<dynamic>;
    print(loadNotification);
    for (var element in loadNotification) {
      final data = element as Map<String, dynamic>;
      notificatins!.add(NotificatonModal.fromJson(data));
    }
  }

  Future<void> markNotificationsRead() async {
    final data = loginhandler().getData();
    final accessTokken = data!.token;

    const url = "$baseurl/markNotificationAsRead";

    final response = await UserApiHandler().putApiCall(url, accessTokken);
    print(response.body);
  }

  void clearNotifications() {
    notificatins!.clear();
    notificatins = null;
    notifyListeners();
  }
}
