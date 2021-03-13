import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ktzh_app/util/util.dart';
import 'package:ktzh_app/views/main_page.dart';
import 'package:ktzh_app/views/product_page.dart';
import 'package:ktzh_app/views/profile_page.dart';
import 'package:vibration/vibration.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  static final navigatorKey = GlobalKey<NavigatorState>();

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
      // dfif
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

      showNotification(title, body);
      showSnackBar(title, body);
      playVibration();
    });
  }

  void playVibration() async {
    if (await Vibration.hasCustomVibrationsSupport()) {
      Vibration.vibrate(duration: 500, amplitude: 50);
    } else {
      Vibration.vibrate();
      await Future.delayed(Duration(milliseconds: 500));
      Vibration.vibrate(amplitude: 50);
    }
  }

  void showNotification(String title, String body) async {
    var androidDetails = AndroidNotificationDetails(
        'channelId', 'channelName', 'channelDescription');
    var iosDetails = IOSNotificationDetails();
    var details = NotificationDetails(android: androidDetails, iOS: iosDetails);
    await notifiyer.show(0, '$title', '$body', details,
        payload: 'Notification');
  }

  void inProcess() {
    _scaffoldKey.currentState.openEndDrawer();
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        duration: Duration(seconds: 5),
        backgroundColor: Colors.orange,
        content: Container(
            height: ScreenUtil().setHeight(100.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Находится в разработке',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(45.0),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  void showSnackBar(String title, String body) async {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        backgroundColor: Color.fromRGBO(0, 148, 224, 1),
        content: Container(
            height: ScreenUtil().setHeight(150.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '$title',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(45.0),
                  ),
                ),
                Text(
                  '$body',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(35.0),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreenUtilInit(
          designSize: Size(1080, 2340),
          builder: () => Scaffold(
            resizeToAvoidBottomPadding: false,
            key: _scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.white,
              shadowColor: Colors.transparent,
              title: Image.asset('assets/images/ktzh.png'),
              iconTheme: IconThemeData(color: Colors.black),
            ),
            drawer: drawer(),
            body: MaterialApp(
              navigatorKey: navigatorKey,
              debugShowCheckedModeBanner: false,
              routes: {
                '/': (BuildContext context) => MainPage(),
                '/profile_page': (BuildContext context) => ProfilePage(),
              },
              onGenerateRoute: (settings) {
                if (settings.name == '/product_page') {
                  List args = settings.arguments;
                  return MaterialPageRoute(
                    builder: (context) {
                      return ProductPage(
                        product: args[0],
                      );
                    },
                  );
                }

                return MaterialPageRoute(
                  builder: (context) {
                    return Scaffold();
                  },
                );
              },
              initialRoute: '/',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
            ),
          ),
        ));
  }

  Widget drawer() {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.cyan),
              accountName: Text(
                'Dimash Kudaibergen',
                style: TextStyle(color: Colors.black),
              ),
              accountEmail: Text(
                'ktzh@gmail.com',
                style: TextStyle(color: Colors.black),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/ktzh.png'),
              )),
          ListTile(
              title: Text('Профиль'),
              onTap: () {
                _scaffoldKey.currentState.openEndDrawer();
                navigatorKey.currentState.popUntil(ModalRoute.withName('/'));
                navigatorKey.currentState.pushNamed('/profile_page');
              }),
          Divider(thickness: ScreenUtil().setHeight(2)),
          ListTile(
            title: Text('Мои товары'),
            onTap: () {
              _scaffoldKey.currentState.openEndDrawer();
              navigatorKey.currentState.popUntil(ModalRoute.withName('/'));
            },
          ),
          Divider(thickness: ScreenUtil().setHeight(2)),
          ListTile(
            title: Text('Задержанные товары'),
            onTap: inProcess,
          ),
          Divider(thickness: ScreenUtil().setHeight(2)),
          ListTile(
            title: Text('На карте'),
            onTap: inProcess,
          ),
        ],
      ),
    );
  }
}
