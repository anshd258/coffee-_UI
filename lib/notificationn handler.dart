import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:inter_coffee/provider/notificatonhandler.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  createnotification(message);
  print(
      "Handling a background message: ${message.notification!.android!.priority}");
}

Future<void> initializeNotification(FirebaseMessaging messaging) async {
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
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}
