import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ktzh_app/model/product_model.dart';
import 'package:ktzh_app/util/util.dart';

TextStyle dateStyle = TextStyle(
  color: Colors.grey,
  fontSize: ScreenUtil().setSp(45.0),
);

TextStyle cityStyle = TextStyle(
  color: Colors.black,
  fontSize: ScreenUtil().setSp(55.0),
  fontWeight: FontWeight.normal,
);

Widget searchBar(Function(String) onEdit) {
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
      child: Container(
        width: double.infinity,
        height: ScreenUtil().setHeight(130.0),
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setHeight(10.0)),
        child: Theme(
          data: new ThemeData(
            primaryColor: Colors.white,
            primaryColorDark: Colors.white,
          ),
          child: TextField(
            onChanged: (val) {
              onEdit(val);
            },
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
    ),
  );
}

Widget customButton(Function onSearch) {
  return InkWell(
    onTap: onSearch,
    child: Container(
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
    ),
  );
}

Widget productCard(Product product) {
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
        fromToWidget(product),
        line("трэк номер", product.trackingNumber),
        status(product)
      ],
    ),
  );
}

Widget fromToWidget(Product product) {
  String firstStation = "";
  String lastStation = "";
  int len = product.routes.length;

  firstStation = product.routes[0].stationName;
  lastStation = product.routes[0].stationName;

  var deaprtureDate = getDate(product.routes[0].timeDeparture);
  var departureTime = getTime(product.routes[0].timeDeparture);

  var deliverDate = getDate(product.routes[len - 1].timeDeparture);
  var deliverTime = getTime(product.routes[len - 1].timeDeparture);
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          Text('$deaprtureDate $departureTime',
              style: dateStyle.copyWith(fontSize: ScreenUtil().setSp(50.0))),
          SizedBox(height: ScreenUtil().setHeight(20.0)),
          Text('$firstStation', style: cityStyle),
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
          Text('$deliverDate $deliverTime',
              style: dateStyle.copyWith(fontSize: ScreenUtil().setSp(50.0))),
          SizedBox(height: ScreenUtil().setHeight(20.0)),
          Text('$lastStation', style: cityStyle),
        ],
      ),
    ],
  );
}

Widget status(Product product) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('статус: ', style: dateStyle),
      Container(
        child: Row(
          children: [
            Text(product.getStatus(), style: dateStyle),
            product.getImageByStatus(),
          ],
        ),
      )
    ],
  );
}

Widget line(String title, String val) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: dateStyle,
      ),
      Text(
        val,
        style: dateStyle,
      )
    ],
  );
}

Widget titles() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text('трек номер', style: dateStyle),
      Text('статус', style: dateStyle),
    ],
  );
}

Widget values(Product product) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('${product.trackingNumber}', style: dateStyle),
      Container(
        width: ScreenUtil().setHeight(300.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${product.getStatus()}', style: dateStyle),
            product.getImageByStatus(),
          ],
        ),
      )
    ],
  );
}
