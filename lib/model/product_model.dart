import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Product {
  final String id;
  final String name;
  final double weight;
  final String ordererName;
  final Station currentStation;
  final List<Station> path;
  final int delayInHours;

  Product(this.id, this.name, this.weight, this.ordererName,
      this.currentStation, this.path, this.delayInHours);

  String getStatus() {
    if (delayInHours > 0) {
      return "задержывается";
    }

    if (currentStation.name != path[path.length - 1].name) {
      return "в пути";
    } else {
      return "доставлен";
    }
  }

  SvgPicture getImageByStatus() {
    String status = getStatus();

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
}

class Station {
  final String name;
  final String arrival;
  final String departure;

  Station(
    this.name,
    this.arrival,
    this.departure,
  );

  bool isStationPassed() {
    if (DateTime.now().difference(DateTime.parse(arrival)).inMinutes > 0) {
      return true;
    }
    return false;
  }
}

var stations = [
  Station("Алматы", "", "2021-03-13 22:05"),
  Station("Капшагай", "2021-03-14 00:15", "2021-03-13 00:30"),
  Station("Сарыөзек", "2021-03-14 03:20", "2021-03-13 03:25"),
  Station("Уштөбе", "2021-03-14 05:25", "2021-03-13 05:50"),
  Station("Сатай", "2021-03-14 08:23", "2021-03-13 08:43"),
  Station("Актогай", "2021-03-14 12:00", "2021-03-13 19:00"),
  Station("Аягөз", "2021-03-15 02:30", ""),
];

var testData = [
  Product("FAASDAS", "Уголь", 2000.0, "Қадірбек",
      Station("Сатай", "2021-03-14 08:23", "2021-03-13 08:43"), stations, 0),
  Product("SCDFVR33DVVEC", "Уголь", 2000.0, "Қадірбек",
      Station("Сатай", "2021-03-14 08:23", "2021-03-13 08:43"), stations, 0),
  Product("SCDFVR33DVVEC", "Уголь", 2000.0, "Қадірбек",
      Station("Аягөз", "2021-03-15 02:30", ""), stations, 0),
  Product("FAASDAS", "Уголь", 2000.0, "Қадірбек",
      Station("Сатай", "2021-03-14 08:23", "2021-03-13 08:43"), stations, 2),
  Product("SCDFVR33DVVEC", "Уголь", 2000.0, "Қадірбек",
      Station("Сатай", "2021-03-14 08:23", "2021-03-13 08:43"), stations, 0),
  Product("SCDFVR33DVVEC", "Уголь", 2000.0, "Қадірбек",
      Station("Аягөз", "2021-03-15 02:30", ""), stations, 0),
  Product("FAASDAS", "Уголь", 2000.0, "Қадірбек",
      Station("Сатай", "2021-03-14 08:23", "2021-03-13 08:43"), stations, 0),
  Product("SCDFVR33DVVEC", "Уголь", 2000.0, "Қадірбек",
      Station("Аягөз", "2021-03-15 02:30", ""), stations, 0),
  Product("FAASDAS", "Уголь", 2000.0, "Қадірбек",
      Station("Сатай", "2021-03-14 08:23", "2021-03-13 08:43"), stations, 3),
  Product("SCDFVR33DVVEC", "Уголь", 2000.0, "Қадірбек",
      Station("Сатай", "2021-03-14 08:23", "2021-03-13 08:43"), stations, 0),
];
