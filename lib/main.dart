import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ktzh_app/navigation/app.dart';
import 'package:ktzh_app/util/util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(MaterialApp(
    home: App(),
  ));
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  var msg = json.decode(message.notification.body);
  var title = '';
  var body = '';
  var obj = parseMsg(msg);

  if (obj['status'] == null)
    return;
  else if (obj['status'] == 'arrived') {
    title = 'Посылка прибыла';
    body =
        'Ваша посылка с тэгом ${obj['tracking_number']} прибыла на станцию ${obj['station_name']}';
  } else if (obj['status'] == 'late') {
    title = 'Посылка прибыла';
    body =
        'Ваша посылка с тэгом ${obj['tracking_number']} прибыла на станцию ${obj['station_name']} с опазданием на ${(42690 / 3600).toStringAsFixed(1)} часов';
  } else if (obj['status'] == 'scheduled') {
    title = 'Посылка в пути';
    body = 'Ваша посылка с тэгом ${obj['tracking_number']} в пути';
  }

  FlutterLocalNotificationsPlugin notifiyer;
  var androidInit = AndroidInitializationSettings('ic_launcher');
  var iosInit = IOSInitializationSettings();
  var initSettings = InitializationSettings(android: androidInit, iOS: iosInit);

  notifiyer = FlutterLocalNotificationsPlugin();
  notifiyer.initialize(initSettings);

  var androidDetails = AndroidNotificationDetails(
      'channelId', 'channelName', 'channelDescription');
  var iosDetails = IOSNotificationDetails();
  var details = NotificationDetails(android: androidDetails, iOS: iosDetails);
  await notifiyer.show(0, '$title', '$body', details, payload: 'Notification');
}
