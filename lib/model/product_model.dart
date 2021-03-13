import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Product {
  final int id;
  final String trackingNumber;
  final String status;
  final int currnetRouteId;
  final List<Station> routes;

  Product(this.id, this.trackingNumber, this.status, this.currnetRouteId,
      this.routes);

  static List<Product> parseJsonList(jsonList) {
    List<Product> products = [];
    for (var p in jsonList) {
      products.add(Product.parseJson(p));
    }
    return products;
  }

  factory Product.parseJson(obj) {
    List<Station> stations = [];
    for (var o in obj['routes']) {
      stations.add(Station.parseJson(o));
    }

    return Product(obj['id'], obj['tracking_number'], obj['status'],
        obj['currentRoute_id'], stations);
  }

  String getStatus() {
    if (status == "scheduled") {
      return "задержан";
    } else if (status == 'delivered') {
      return 'доставлен';
    }
    return 'в пути';
  }

  Widget getImageByStatus() {
    if (status == "scheduled") {
      return SvgPicture.asset(
        'assets/images/delayed.svg',
        color: Colors.orange,
        width: ScreenUtil().setHeight(60.0),
        height: ScreenUtil().setHeight(60.0),
      );
    } else if (status == 'delivered') {
      return SvgPicture.asset(
        'assets/images/delivered.svg',
        color: Colors.green,
        width: ScreenUtil().setHeight(60.0),
        height: ScreenUtil().setHeight(60.0),
      );
    }
    return SvgPicture.asset(
      'assets/images/train.svg',
      color: Colors.blue,
      width: ScreenUtil().setHeight(60.0),
      height: ScreenUtil().setHeight(60.0),
    );
  }
}

SvgPicture getImageByStatus() {
  String status = 'в пути';

  if (status == "задержывается") {
    return SvgPicture.asset(
      'assets/images/delayed.svg',
      color: Colors.orange,
      width: ScreenUtil().setHeight(70.0),
    );
  } else if (status == "в пути") {
    return SvgPicture.asset(
      'assets/images/train.svg',
      color: Colors.black,
      width: ScreenUtil().setHeight(70.0),
    );
  } else {
    return SvgPicture.asset(
      'assets/images/delivered.svg',
      color: Colors.green,
      width: ScreenUtil().setHeight(70.0),
    );
  }
}

class Station {
  final int id;
  final String timeArrival;
  final int shippingId;
  final String timeDeparture;
  final int routeOrder;
  final int delay;
  final bool onTime;
  final int trainId;
  final String stationName;
  final String status;

  Station(
      this.id,
      this.timeArrival,
      this.shippingId,
      this.timeDeparture,
      this.routeOrder,
      this.delay,
      this.onTime,
      this.trainId,
      this.stationName,
      this.status);

  factory Station.parseJson(obj) {
    return Station(
        obj['id'],
        obj['timeArrival'],
        obj['shipping_id'],
        obj['timeDeparture'],
        obj['routeOrder'],
        obj['delay'],
        obj['on_time'],
        obj['train_id'],
        obj['station_name'],
        obj['status']);
  }
}
