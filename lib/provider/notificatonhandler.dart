import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:inter_coffee/provider/loginhandler/loginsharedpref.dart';

void createnotification(RemoteMessage message) async {
  final userId = await getUserId();
  final role = await getRole();
  if (role != "merchant" && role != null) {
    if (message.notification != null && message.data['userId'] == userId) {
      AwesomeNotifications().createNotification(
          content: NotificationContent(
        id: message.notification.hashCode,
        channelKey: 'basic_channel',
        title: message.notification!.title,
        body: message.notification!.body,
      ));
      print('Message also contained a notification: ${message.notification}');
    }
  } else if (role == "merchant" && role != null) {
    if (message.notification != null) {
      final merchantData =
          json.decode(message.data['merchantId']) as List<dynamic>;
      print(merchantData.contains(userId));
      if (merchantData.contains(userId)) {
        AwesomeNotifications().createNotification(
            content: NotificationContent(
          id: message.notification.hashCode,
          channelKey: 'alerts',
          title: message.notification!.title,
          body: message.notification!.body,
        ));
        print('Message also contained a notification: ${message.notification}');
      }
    }
  }
}
