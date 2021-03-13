import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ktzh_app/util/util.dart';

TextStyle dateStyle = TextStyle(
  color: Colors.grey,
  fontSize: ScreenUtil().setSp(45.0),
);

TextStyle cityStyle = TextStyle(
  color: Colors.black,
  fontSize: ScreenUtil().setSp(45.0),
);

Widget searchBar() {
  return Container(
    height: ScreenUtil().setHeight(260.0),
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setHeight(30.0)),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(ScreenUtil().setHeight(25.0)),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: ScreenUtil().setHeight(10.0),
          spreadRadius: ScreenUtil().setHeight(10.0),
        ),
      ],
    ),
    child: Center(
      child: Row(
        children: [
          Container(
            width: ScreenUtil().setHeight(700.0),
            height: ScreenUtil().setHeight(130.0),
            padding:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setHeight(10.0)),
            child: Theme(
              data: new ThemeData(
                primaryColor: Colors.white,
                primaryColorDark: Colors.white,
              ),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(231, 231, 231, 1),
                  hintText: "Введите трек номер",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: ScreenUtil().setSp(38.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(
                      ScreenUtil().setHeight(25.0),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(
                      ScreenUtil().setHeight(25.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: ScreenUtil().setHeight(30.0)),
          Expanded(child: customButton()),
        ],
      ),
    ),
  );
}

Widget customButton() {
  return Container(
    width: double.infinity,
    height: ScreenUtil().setHeight(115.0),
    decoration: BoxDecoration(
      color: Color.fromRGBO(176, 144, 35, 1),
      boxShadow: [
        BoxShadow(
          color: Colors.black,
          blurRadius: ScreenUtil().setHeight(2),
        ),
      ],
      borderRadius: BorderRadius.circular(ScreenUtil().setHeight(15.0)),
    ),
    child: Center(
      child: Text(
        'поиск'.toUpperCase(),
        style: TextStyle(
          color: Colors.white,
          fontSize: ScreenUtil().setSp(37.0),
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
  );
}

Widget productCard() {
  return Container(
    margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(45.0)),
    padding: EdgeInsets.all(ScreenUtil().setHeight(40.0)),
    width: double.infinity,
    height: ScreenUtil().setHeight(450.0),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        width: ScreenUtil().setHeight(2),
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(
        ScreenUtil().setHeight(25),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        fromToWidget(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            titles(),
            values("delivered"),
          ],
        )
      ],
    ),
  );
}

Widget fromToWidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          Text('13 March, 2021 ', style: dateStyle),
          Text('Taraz', style: cityStyle),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: ScreenUtil().setHeight(100.0),
            height: ScreenUtil().setHeight(6),
            color: Colors.black,
          )
        ],
      ),
      Column(
        children: [
          Text('13 March, 2021 ', style: dateStyle),
          Text('Nur-Sultan', style: cityStyle),
        ],
      ),
    ],
  );
}

Widget titles() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text('тип товара', style: dateStyle),
      Text('трек номер', style: dateStyle),
      Text('статус', style: dateStyle),
    ],
  );
}

Widget values(String status) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('айран', style: dateStyle),
      Text('SADV43DFG21', style: dateStyle),
      Container(
        child: Row(
          children: [
            Text('${getStatus(status)}', style: dateStyle),
            SvgPicture.asset(
              'assets/images/${getImgByStatus(status)}.svg',
              color: Colors.black,
              width: ScreenUtil().setHeight(70.0),
            )
          ],
        ),
      )
    ],
  );
}
