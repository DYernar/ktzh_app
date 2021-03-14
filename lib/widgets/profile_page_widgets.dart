import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget profileData() {
  return Padding(
    padding: EdgeInsets.only(top: 5.0, left: 30.0, right: 30.0),
    child: Container(
      height: ScreenUtil().setHeight(420.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
          border: Border.all(color: Colors.black12)),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                radius: ScreenUtil().setHeight(150.0),
                backgroundColor: Colors.purple,
                child: Center(
                  child: Text(
                    'M',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(100.0)),
                  ),
                ),
              ),
              Container(
                height: ScreenUtil().setHeight(410.0),
                width: ScreenUtil().setHeight(580.0),
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: ScreenUtil().setHeight(20.0)),
                    Text('Mark Lawrence',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold)),
                    Divider(
                      color: Colors.white,
                      height: ScreenUtil().setHeight(25.0),
                      thickness: ScreenUtil().setHeight(20.0),
                    ),
                    Text(
                      'mark.lawrence@nu.edu.kz',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 17.0),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(13.0)),
                    SizedBox(
                      height: 1.0,
                      width: ScreenUtil().setHeight(450.0),
                      child: const DecoratedBox(
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(10.0)),
                    Text('+7 789 123 4564',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 17.0)),
                    SizedBox(height: ScreenUtil().setHeight(13.0)),
                    SizedBox(
                      height: 1.0,
                      width: ScreenUtil().setHeight(450.0),
                      child: const DecoratedBox(
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(13.0)),
                    Text('Nazarbayev University',
                        style: TextStyle(fontSize: 17.0)),
                    SizedBox(height: ScreenUtil().setHeight(13.0)),
                    SizedBox(
                      height: 1.0,
                      width: ScreenUtil().setHeight(450.0),
                      child: const DecoratedBox(
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget editAndProfile() {
  return Padding(
    padding: EdgeInsets.only(left: 35.0, right: 35.0, top: 15, bottom: 5.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Личные данные',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'изменить',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.blueAccent,
              ),
            )
          ],
        )
      ],
    ),
  );
}

Widget navigateBtn(String title) {
  return Container(
    margin: EdgeInsets.all(ScreenUtil().setHeight(20.0)),
    width: ScreenUtil().setHeight(800.0),
    height: ScreenUtil().setHeight(200.0),
    decoration: BoxDecoration(
      color: Colors.grey[100],
      borderRadius: BorderRadius.circular(
        ScreenUtil().setHeight(30.0),
      ),
      border: Border.all(
        width: ScreenUtil().setHeight(3),
        color: Colors.grey[600],
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: ScreenUtil().setHeight(40),
        ),
      ],
    ),
    padding: EdgeInsets.only(left: ScreenUtil().setHeight(20.0)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$title"),
        Container(
          height: ScreenUtil().setHeight(150.0),
          width: ScreenUtil().setHeight(180.0),
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.grey,
            size: ScreenUtil().setHeight(120.0),
          ),
        )
      ],
    ),
  );
}

Widget signOutBtn() {
  return Padding(
    padding: EdgeInsets.only(top: 15.0, left: 30.0, right: 30.0),
    child: Container(
      alignment: Alignment.center,
      height: ScreenUtil().setHeight(120.0),
      width: ScreenUtil().setHeight(600.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.blue[400],
          border: Border.all(color: Colors.black12)),
      child: Text(
        'Выход',
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    ),
  );
}
