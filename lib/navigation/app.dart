import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ktzh_app/views/main_page.dart';
import 'package:ktzh_app/views/product_page.dart';

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
        builder: () => MaterialApp(
          routes: {
            '/': (BuildContext context) => MainPage(),
            '/product_page': (BuildContext context) => ProductPage()
          },
          initialRoute: '/',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        ),
      ),
    );
  }
}
