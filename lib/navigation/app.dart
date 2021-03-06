import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ktzh_app/util/util.dart';
import 'package:ktzh_app/views/main_page.dart';
import 'package:ktzh_app/views/map_page.dart';
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
  static final upperKey = GlobalKey<NavigatorState>();
  bool received = false;

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

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      var msg = json.decode(message.notification.body);
      var title = '';
      var body = '';
      var obj = parseMsg(msg);

      if (obj['status'] == null)
        return;
      else if (obj['status'] == 'arrived') {
        title = '?????????????? ??????????????';
        body =
            '???????? ?????????????? ?? ?????????? ${obj['tracking_number']} ?????????????? ???? ?????????????? ${obj['station_name']}';
      } else if (obj['status'] == 'late') {
        title = '?????????????? ??????????????';
        body =
            '???????? ?????????????? ?? ?????????? ${obj['tracking_number']} ?????????????? ???? ?????????????? ${obj['station_name']} ?? ???????????????????? ???? ${(42690 / 3600).toStringAsFixed(1)} ??????????';
      } else if (obj['status'] == 'scheduled') {
        title = '?????????????? ?? ????????';
        body = '???????? ?????????????? ?? ?????????? ${obj['tracking_number']} ?? ????????';
      }

      showNotification(title, body);
      showPopUp(title, body);
      playVibration();
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // dfif
      var msg = json.decode(message.notification.body);
      var title = '';
      var body = '';
      var obj = parseMsg(msg);

      if (obj['status'] == null)
        return;
      else if (obj['status'] == 'arrived') {
        title = '?????????????? ??????????????';
        body =
            '???????? ?????????????? ?? ?????????? ${obj['tracking_number']} ?????????????? ???? ?????????????? ${obj['station_name']}';
      } else if (obj['status'] == 'late') {
        title = '?????????????? ??????????????';
        body =
            '???????? ?????????????? ?? ?????????? ${obj['tracking_number']} ?????????????? ???? ?????????????? ${obj['station_name']} ?? ???????????????????? ???? ${(42690 / 3600).toStringAsFixed(1)} ??????????';
      } else if (obj['status'] == 'scheduled') {
        title = '?????????????? ?? ????????';
        body = '???????? ?????????????? ?? ?????????? ${obj['tracking_number']} ?? ????????';
      }

      showNotification(title, body);
      showPopUp(title, body);
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
                '?????????????????? ?? ????????????????????',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(45.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showPopUp(String title, String body) {
    if (received) {
      Navigator.pop(context);
    }
    setState(() {
      received = true;
    });

    showDialog(
      context: _scaffoldKey.currentContext,
      child: AlertDialog(
        backgroundColor: Colors.transparent,
        content: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              ScreenUtil().setHeight(40.0),
            ),
          ),
          height: ScreenUtil().setHeight(700.0),
          width: ScreenUtil().setHeight(900.0),
          padding: EdgeInsets.all(ScreenUtil().setHeight(20.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "$title",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(60.0),
                  ),
                ),
              ),
              Icon(
                Icons.delivery_dining,
                size: ScreenUtil().setHeight(100.0),
                color: Colors.green,
              ),
              Text(
                "$body",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(45.0),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    ).then((value) {
      setState(() {
        received = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 1080, height: 2340, allowFontScaling: true);

    return MaterialApp(
      navigatorKey: upperKey,
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return errorPage();
          }
          return Scaffold(
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
                '/map_page': (BuildContext context) => MapPage(),
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
          );
        },
      ),
    );
  }

  Widget errorPage() {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: ScreenUtil().setHeight(500.0),
            child: Text(
              "????????????",
            ),
          ),
        ],
      ),
    );
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
              title: Text('??????????????'),
              onTap: () {
                _scaffoldKey.currentState.openEndDrawer();
                navigatorKey.currentState.popUntil(ModalRoute.withName('/'));
                navigatorKey.currentState.pushNamed('/profile_page');
              }),
          Divider(thickness: ScreenUtil().setHeight(2)),
          ListTile(
            title: Text('?????? ????????????'),
            onTap: () {
              _scaffoldKey.currentState.openEndDrawer();
              navigatorKey.currentState.popUntil(ModalRoute.withName('/'));
            },
          ),
          Divider(thickness: ScreenUtil().setHeight(2)),
          ListTile(
            title: Text('?????????????????????? ????????????'),
            onTap: inProcess,
          ),
          Divider(thickness: ScreenUtil().setHeight(2)),
          ListTile(
            title: Text('???? ??????????'),
            onTap: () {
              _scaffoldKey.currentState.openEndDrawer();
              navigatorKey.currentState.popUntil(ModalRoute.withName('/'));
              navigatorKey.currentState.pushNamed('/map_page');
            },
          ),
        ],
      ),
    );
  }
}
