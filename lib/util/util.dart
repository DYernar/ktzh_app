import 'package:flutter/material.dart';

String getDate(String date) {
  var lst = date.split("T");
  if (lst.length == 2) {
    lst = lst[0].split("-");
    var date = DateTime.parse("${lst[0]}-${lst[1]}-${lst[2]} 21:20:31.462114");
    var month = getMonth(date.month);
    var day = date.day;
    return "$day $month";
  }
  return "";
}

String getTime(String time) {
  var lst = time.split("T");
  if (lst.length > 1) {
    lst = lst[1].split(":");
    if (lst.length >= 2) {
      return '${lst[0]}:${lst[1]}';
    }
    return "";
  }
  return "";
}

String getMonth(int m) {
  switch (m) {
    case 0:
      return "янв";
      break;
    case 2:
      return "фев";
      break;
    case 3:
      return "мар";
      break;
    case 4:
      return "апр";
      break;
    case 5:
      return "май";
      break;
    case 6:
      return "июнь";
      break;
    case 7:
      return "июль";
      break;
    case 8:
      return "авг";
      break;
    case 9:
      return "сен";
      break;
    case 10:
      return "окт";
      break;
    case 11:
      return "ноя";
      break;
    case 12:
      return "дек";
      break;
    default:
      return "";
      break;
  }
}

Color getColorByDelay(int delay) {
  if (delay == 0) return Colors.blueAccent;
  return Colors.orange[400];
}

Map<String, dynamic> parseMsg(var obj) {
  print(obj);
  return {
    "id": obj["shipping"]["id"],
    "tracking_number": obj['shipping']['tracking_number'],
    "delay": obj['updatedRoute']['delay'],
    "station_name": obj['updatedRoute']['station_name'],
    "time_arrival": obj['updatedRoute']['timeArrival'],
    'status': obj["updatedRoute"]['status'],
  };
}
