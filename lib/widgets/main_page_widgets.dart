import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ktzh_app/model/product_model.dart';

TextStyle dateStyle = TextStyle(
  color: Colors.grey,
  fontSize: ScreenUtil().setSp(45.0),
);

TextStyle cityStyle = TextStyle(
  color: Colors.black,
  fontSize: ScreenUtil().setSp(55.0),
  fontWeight: FontWeight.normal,
);

Widget searchBar(Function(String) onEdit, Function onSearch) {
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
          SizedBox(width: ScreenUtil().setHeight(30.0)),
<<<<<<< HEAD
          Expanded(
              child: customButton()),
=======
          Expanded(child: customButton(onSearch)),
>>>>>>> d3a22d0918ff3cb9589c0ac69dd4abbf05295b1e
        ],
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            titles(),
            values(product),
          ],
        )
      ],
    ),
  );
}

Widget fromToWidget(Product product) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          Text('${product.path[0].departure}', style: dateStyle),
          Text('${product.path[0].name}', style: cityStyle),
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
          Text('${product.path[product.path.length - 1].arrival} ',
              style: dateStyle),
          Text('${product.path[product.path.length - 1].name}',
              style: cityStyle),
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

Widget values(Product product) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('${product.name}', style: dateStyle),
      Text('${product.id}', style: dateStyle),
      Container(
        width: ScreenUtil().setHeight(450.0),
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
