import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ktzh_app/widgets/profile_page_widgets.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Профиль',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(30.0)),
              editAndProfile(),
              profileData(),
              SizedBox(height: ScreenUtil().setHeight(30.0)),
              navigateBtn("Мои заказы"),
              navigateBtn("Доставленные"),
              navigateBtn("FAQ"),
              navigateBtn("Помощь"),
              signOutBtn(),
            ],
          ),
        ],
      ),
    );
  }
}
