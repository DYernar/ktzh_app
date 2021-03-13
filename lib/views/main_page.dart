import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ktzh_app/widgets/main_page_widgets.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setHeight(40.0)),
        child: Column(
          children: [
            SizedBox(height: ScreenUtil().setHeight(100.0)),
            searchBar(),
            SizedBox(height: ScreenUtil().setHeight(15.0)),
            productList(),
          ],
        ),
      ),
    );
  }

  Widget productList() {
    return Expanded(
        child: SingleChildScrollView(
      child: Column(
        children: [
              SizedBox(height: ScreenUtil().setHeight(40.0)),
              Container(),
            ] +
            [1, 2, 3, 4, 5].map((e) => productCard()).toList(),
      ),
    ));
  }
}
