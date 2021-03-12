import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreenUtilInit(
        designSize: Size(1080, 2340),
        allowFontScaling: true,
        builder: () => Scaffold(
          appBar: AppBar(),
          drawer: drawer(),
          body: MaterialApp(
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
              child: Image.asset('/assets/images/ktzh.svg'),
            ),
          ),
          ListTile(title: Text('Profile')),
          Divider(thickness: ScreenUtil().setHeight(2)),
          ListTile(title: Text('Profile')),
          Divider(thickness: ScreenUtil().setHeight(2)),
          ListTile(title: Text('Profile')),
          Divider(thickness: ScreenUtil().setHeight(2)),
        ],
      ),
    );
  }
}
