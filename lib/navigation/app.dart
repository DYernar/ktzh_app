import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ktzh_app/views/main_page.dart';
import 'package:ktzh_app/views/product_page.dart';
import 'package:ktzh_app/views/profile_page.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin notifiyer;
  @override
  void initState() {
    getNotificationPermissions();
    subscribe();
    initMessaging();
    getToken();
    super.initState();
  }

  void getNotificationPermissions() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  void subscribe() async {
    await FirebaseMessaging.instance.subscribeToTopic('user_1');
  }

  void getToken() async {
    print(await messaging.getToken());
  }

  void initMessaging() {
    var androidInit = AndroidInitializationSettings('ic_launcher');
    var iosInit = IOSInitializationSettings();
    var initSettings =
        InitializationSettings(android: androidInit, iOS: iosInit);

    notifiyer = FlutterLocalNotificationsPlugin();
    notifiyer.initialize(initSettings);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      showNotification(message.notification.title, message.notification.body);
    });
  }

  void showNotification(String title, String body) async {
    var androidDetails = AndroidNotificationDetails(
        'channelId', 'channelName', 'channelDescription');

    var iosDetails = IOSNotificationDetails();

    var details = NotificationDetails(android: androidDetails, iOS: iosDetails);

    await notifiyer.show(0, '$title', '$body', details,
        payload: 'Notification');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenUtilInit(
        designSize: Size(1080, 2340),
        allowFontScaling: true,
        builder: () => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            shadowColor: Colors.transparent,
            title: Image.asset('assets/images/ktzh.png'),
            iconTheme: IconThemeData(color: Colors.black),
          ),
          drawer: drawer(),
          body: MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (BuildContext context) => MainPage(),
              '/product_page': (BuildContext context) => ProductPage(),
              '/profile_page': (BuildContext context) => ProfilePage(),
            },
            initialRoute: '/',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }

  Widget drawer() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(
              child: Image.asset(
                'assets/images/ktzh.png',
              ),
            ),
          ),
          ListTile(title: Text('Мои товары')),
          Divider(thickness: ScreenUtil().setHeight(2)),
          ListTile(title: Text('Профиль')),
          Divider(thickness: ScreenUtil().setHeight(2)),
          ListTile(title: Text('Задержанные товары')),
        ],
      ),
    );
  }
}
