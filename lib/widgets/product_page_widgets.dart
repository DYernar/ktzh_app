import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

TextStyle dateStyle = TextStyle(
  color: Colors.grey,
  fontSize: ScreenUtil().setSp(45.0),
);

TextStyle cityStyle = TextStyle(
  color: Colors.black,
  fontSize: ScreenUtil().setSp(45.0),
);

Widget productDetails() {
  return Container(
    color: Colors.white,
    child: Column(
      children: [
        SvgPicture.asset(
          'assets/images/train.svg',
          color: Colors.black,
          width: ScreenUtil().setHeight(260.0),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "ID:201873297",
          style: TextStyle(fontSize: 35, color: Colors.black),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Название:",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            Text(
              "Уголь",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Вес:",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            Text(
              "2000кг",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Заказчик:",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            Text(
              "Қадірбек",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Станция отправления:",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            Text(
              "Алматы-1",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ],
        )
      ],
    ),
  );
}

Widget orderTimeLine() {
  return Container(
    decoration: BoxDecoration(color: Colors.white),
    margin: EdgeInsets.only(bottom: 3 //SizeConfig.safeBlockHorizontal * 3,
        ),
    padding: EdgeInsets.only(
      top: 5, //SizeConfig.safeBlockHorizontal * 3,
      left: 20, //SizeConfig.safeBlockHorizontal * 7,
      bottom: 8, //SizeConfig.safeBlockHorizontal * 3,
    ),
    child: Column(
      children: <Widget>[
        timelineRow("Алматы-1", "Нет", "13 март, 22:05", "13 март, 22:05"),
        timelineRow("Алматы-1", "Нет", "13 март, 22:05", "13 март, 22:05"),
        timelineRow("Алматы-1", "Нет", "13 март, 22:05", "13 март, 22:05"),
        timelineRow("Алматы-1", "Нет", "13 март, 22:05", "13 март, 22:05"),
        timelineLastRow("Алматы-1", "Нет", "13 март, 22:05", "13 март, 22:05"),
      ],
    ),
  );
}

Widget timelineRow(
    String title, String subTile, String comingDate, String leavingDate) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Expanded(
        flex: 1,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 18,
              height: 18,
              decoration: new BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Text(""),
            ),
            Container(
              width: 3,
              height: 90,
              decoration: new BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
              ),
              child: Text(""),
            ),
          ],
        ),
      ),
      Expanded(
        flex: 9,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                'Станция: ${title}\n'
                'Прибытие: ${comingDate}\n'
                'Отправление: ${leavingDate}\n'
                'Опоздание: ${subTile}',
                style: TextStyle(
                    fontFamily: "regular",
                    fontSize: 14,
                    color: Colors.black54)),
          ],
        ),
      ),
    ],
  );
}

Widget timelineLastRow(
    String title, String subTile, String comingDate, String leavingDate) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Expanded(
        flex: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 18,
              height: 18,
              decoration: new BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Text(""),
            ),
            Container(
              width: 3,
              height: 20,
              decoration: new BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.rectangle,
              ),
              child: Text(""),
            ),
          ],
        ),
      ),
      Expanded(
        flex: 9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('${title}\n ${subTile}\n ${comingDate}\n ${leavingDate}',
                style: TextStyle(
                    fontFamily: "regular",
                    fontSize: 14,
                    color: Colors.black54)),
          ],
        ),
      ),
    ],
  );
}
