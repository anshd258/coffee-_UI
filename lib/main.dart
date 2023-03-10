import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:inter_coffee/main_app.dart';
import 'package:inter_coffee/notificationn%20handler.dart';
import 'package:inter_coffee/provider/loginhandler/loginmodel.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'firebase_options.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import './provider/notificatonhandler.dart';

// ...

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(loginStorageAdapter());
  await Hive.openBox<loginStorage>("session");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  initializeNotification(messaging);

  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });

  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    createnotification(message);
  }).onError((eror) => throw ("error on forground $eror"));
  runApp(const MainApp());
}

bool isAdmin = false;
