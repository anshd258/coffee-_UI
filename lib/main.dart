import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:inter_coffee/main_app.dart';
import 'package:inter_coffee/notificationn_handler.dart';
import 'package:inter_coffee/provider/loginhandler/login_model.dart';
import 'package:inter_coffee/provider/notificaton_handler.dart';

import 'firebase_options.dart';

import 'package:flutter/services.dart';

// ...

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Hive.initFlutter();
  Hive.registerAdapter(loginStorageAdapter());
  await Hive.openBox<loginStorage>("session");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  initializeNotification(messaging);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    createnotification(message);
    print("forground trigger");
  }).onError((eror) => throw ("error on forground $eror"));
  runApp(const MainApp());
}

bool isAdmin = false;
