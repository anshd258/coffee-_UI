import 'dart:convert';
import 'loginhandler/login_functions.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void createnotification(RemoteMessage message) async {
  final data = loginhandler().getData();
  final role = data!.role;
  final userId = data.userId;
  if (role != "merchant") {
    if (message.notification != null && message.data['userId'] == userId) {
      AwesomeNotifications().createNotification(
          content: NotificationContent(
        id: message.notification.hashCode,
        channelKey: 'alerts',
        title: message.notification!.title,
        body: message.notification!.body,
      ));
    }
  } else if (role == "merchant") {
    if (message.notification != null) {
      final merchantData =
          json.decode(message.data['merchantId']) as List<dynamic>;
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
