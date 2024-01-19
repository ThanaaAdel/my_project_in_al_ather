import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:HrmsVersions/core/utils/simple_bloc_observer.dart';

import 'Features/app_home/domain/entities/finger_print_entity.dart';
import 'Features/auth/login/domain/entities/login_entity.dart';
import 'Features/table/domain/entities/table_entity.dart';
import 'app.dart';
import 'core/utils/constants.dart';
import 'core/utils/functions/setup_service_locator.dart' as di;
import 'core/utils/log_utils.dart';
import 'core/utils/notification_settings.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  Log.i("Handling a background message: ${message.messageId}");
}

Future<void> showNotification(Map<String, dynamic> message) async {
  var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
    'com.alatheer.HrmsVersions',
    'HR MS',
    playSound: true,
    enableVibration: true,
    importance: Importance.max,
    priority: Priority.high,
  );
  var platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
    iOS: const DarwinNotificationDetails(),
  );
//   // show local notification //
  await FlutterLocalNotificationsPlugin().show(
    DateTime.now().microsecond,
    message['title'],
    message['body'],
    platformChannelSpecifics,
    payload: json.encode(message),
  );
}

void main() async {
  await Hive.initFlutter();
  await di.init();
  Hive.registerAdapter(LoginEntityAdapter());
  Hive.registerAdapter(FingerPrintEntityAdapter());
  Hive.registerAdapter(TableEntityAdapter());

  await Hive.openBox<LoginEntity>(kEmployeeDataBox);
  await Hive.openBox<FingerPrintEntity>(kFingerPrintDataBox);
  await Hive.openBox<TableEntity>(kTableDataBox);

  await Firebase.initializeApp();
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  WidgetsFlutterBinding.ensureInitialized();

  NotificationsHelper mNotificationSettings = NotificationsHelper();
  mNotificationSettings.configLocalNotification();
  mNotificationSettings.registerNotification();
  Bloc.observer = SimpleBlocObserver();
  runApp(const FingerPrint());
}
