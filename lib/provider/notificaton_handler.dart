import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'loginhandler/login_functions.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void createnotification(RemoteMessage message) async {
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'alerts',
          channelName: 'Alerts',
          channelDescription: 'Notification tests as alerts',
          playSound: true,
          onlyAlertOnce: true,
          groupAlertBehavior: GroupAlertBehavior.Children,
          importance: NotificationImportance.High,
          defaultPrivacy: NotificationPrivacy.Private,
          enableVibration: true,
        )
      ],
      debug: true);
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
