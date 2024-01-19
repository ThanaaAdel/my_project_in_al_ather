import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../../Features/auth/fire_base_token/presentation/manger/token_cubit.dart';

class NotificationsHelper {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void configLocalNotification() {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettingsIOS = DarwinInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    FlutterLocalNotificationsPlugin().initialize(
      initializationSettings,

      //  onSelectNotification: onSelectNotification
    );
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      showNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      showNotification(message);
    });
    FirebaseMessaging.onBackgroundMessage(
        (RemoteMessage message) => showNotification(message));
    _firebaseMessaging.requestPermission(alert: true, badge: true, sound: true);

    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
      BlocProvider.of<TokenCubit>(Get.context!).getTokenData(fcmToken);
    }).onError((err) {});
  }

  void registerNotification() {
    debugPrint('-------------registerNotification----------');
    _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    _firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
      debugPrint('getInitialMessage');
      debugPrint(message.toString());
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
      debugPrint('Got a message whilst in the foreground!');
      debugPrint('Message data: $message');
      debugPrint('Message data: ${message?.data}');
      debugPrint('Message notification: ${message?.notification?.body}');
      if (Platform.isIOS) {
        message = _modifyNotificationJson(message!);
      }
      showNotification(message!);
    });

    FirebaseMessaging.onBackgroundMessage(
        (RemoteMessage message) => showNotification(message));

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage event) async {
      debugPrint('Got a event whilst in the foreground!');
      debugPrint('event data: $event');
      debugPrint('event data: ${event.data}');
      debugPrint('event notification: ${event.notification?.body}');
      // onSelectNotification(
      //   json.encode(event.data),
      // );
    });
  }

  RemoteMessage _modifyNotificationJson(RemoteMessage message) {
    message.data['data'] = Map.from(message.data);
    return message;
  }

  Future<void> showNotification(RemoteMessage message) async {
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
      //  iOS: const IOSNotificationDetails(),
    );
    // show local notification //
    await flutterLocalNotificationsPlugin.show(
      DateTime.now().microsecond,
      message.notification?.title,
      message.notification?.body,
      platformChannelSpecifics,
      payload: json.encode(message.data),
    );
  }

  Future onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    debugPrint('onDidReceiveLocalNotification');

    debugPrint('Notification data');

    // showDialog(
    //   context: Get.context!,
    //   builder: (BuildContext context) => CupertinoAlertDialog(
    //     title: Text(title ?? ''),
    //     content: Text(body ?? ''),
    //     actions: [
    //       CupertinoDialogAction(
    //         isDefaultAction: true,
    //         child: const Text('Ok'),
    //         onPressed: () async {
    //           Get.to(() => NotificationsScreen());
    //         },
    //       )
    //     ],
    //   ),
    // );
  }

  // Future onSelectNotification(String? payload) async {
  //   Get.to(() => NotificationsScreen());

  //   if (json.decode(payload!)['type'] == 'chat') {
  //     Navigator.pushNamed(Get.context!, messagesScreen,
  //         arguments: int.parse(json.decode(payload)['sender_id']));
  //   } else {
  //     Get.to(() => NotificationsScreen());
  //   }
  // }
}
