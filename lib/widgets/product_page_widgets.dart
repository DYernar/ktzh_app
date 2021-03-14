import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ktzh_app/model/product_model.dart';
import 'package:ktzh_app/util/util.dart';
import 'package:timeline_tile/timeline_tile.dart';

TextStyle titleStyle = TextStyle(
  color: Colors.grey,
  fontSize: ScreenUtil().setSp(45.0),
);

TextStyle valueStyle = TextStyle(
  color: Colors.black,
  fontSize: ScreenUtil().setSp(45.0),
  fontWeight: FontWeight.normal,
);

Widget productDetails(Product product) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(ScreenUtil().setHeight(60.0)),
        bottomRight: Radius.circular(
          ScreenUtil().setHeight(60.0),
        ),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: ScreenUtil().setSp(25),
          offset: Offset(
            0.0,
            0.75,
          ),
        ),
      ],
    ),
    height: ScreenUtil().setHeight(900.0),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setHeight(40.0)),
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
            "# ${product.trackingNumber}",
            style: TextStyle(
                fontSize: ScreenUtil().setSp(60.0),
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Статус:", style: titleStyle),
              Text("${product.getStatus()}", style: valueStyle),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Название:", style: titleStyle),
              Text("Уголь", style: valueStyle),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Вес:", style: titleStyle),
              Text("2000кг", style: valueStyle),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Заказчик:", style: titleStyle),
              Text("Қадірбек", style: valueStyle),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Станция отправления:", style: titleStyle),
              Text("${product.getFirstStation()}", style: valueStyle),
            ],
          )
        ],
      ),
    ),
  );
}

Widget orderTimeLine(Product product) {
  List<Widget> timeline = [SizedBox(height: ScreenUtil().setHeight(200.0))];

  for (int i = 0; i < product.routes.length; i++) {
    timeline.add(singleTimeLine(product.routes, i, product.currnetRouteId));
    if (i != product.routes.length - 1)
      timeline.add(placeHolderLine(product.routes, i, product.currnetRouteId));
  }
  return Column(
    children: timeline,
  );
}

Widget placeHolderLine(List<Station> stations, int index, int currentIndex) {
  Color color = Colors.grey;

  if (stations[index].id < currentIndex) {
    color = getColorByDelay(stations[index].delay);
  }

  return TimelineTile(
    alignment: TimelineAlign.manual,
    lineXY: 0.5,
    hasIndicator: false,
    afterLineStyle: LineStyle(color: color),
    beforeLineStyle: LineStyle(color: color),
  );
}

Widget singleTimeLine(List<Station> stations, int index, int currentIndex) {
  return TimelineTile(
    alignment: TimelineAlign.center,
    isFirst: index == 0,
    isLast: index == stations.length - 1,
    afterLineStyle: LineStyle(
      color: stations[index].id < currentIndex
          ? getColorByDelay(stations[index].delay)
          : Colors.grey,
    ),
    indicatorStyle: IndicatorStyle(
      width: ScreenUtil().setHeight(200.0),
      height: ScreenUtil().setHeight(200.0),
      color: getColorByDelay(stations[index].delay),
      indicatorXY: 0.2,
      indicator: Container(
        width: ScreenUtil().setHeight(200.0),
        height: ScreenUtil().setHeight(200.0),
        decoration: BoxDecoration(
          color: stations[index].id <= currentIndex
              ? getColorByDelay(stations[index].delay)
              : Colors.grey,
          borderRadius: BorderRadius.circular(ScreenUtil().setHeight(100.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: ScreenUtil().setHeight(10.0),
            )
          ],
        ),
        child: Center(
            child: index == 0 || index == stations.length - 1
                ? SvgPicture.asset(
                    'assets/images/flag.svg',
                    color: index == 0 || currentIndex == stations.length - 1
                        ? Colors.yellowAccent
                        : Colors.white,
                  )
                : Container()),
      ),
    ),
    endChild: stationHolder(stations[index]),
    startChild: timeHolder(stations[index]),
  );
}

Widget timeHolder(Station station) {
  String arrivalDate = getDate(station.timeArrival);
  String arrivalTime = getTime(station.timeArrival);
  String depDate = getDate(station.timeDeparture);
  String depTime = getTime(station.timeDeparture);
  return Container(
    height: ScreenUtil().setHeight(450.0),
    child: Column(
      children: [
        Text(
          '$arrivalDate $arrivalTime',
          style: valueStyle,
        ),
        SizedBox(height: ScreenUtil().setHeight(100.0)),
        Text(
          '$depDate $depTime',
          style: valueStyle,
        ),
      ],
    ),
  );
}

Widget stationHolder(Station station) {
  return Container(
    height: ScreenUtil().setHeight(450.0),
    child: Column(children: [
      SizedBox(height: ScreenUtil().setHeight(70.0)),
      Text(
        station.stationName,
        style: valueStyle.copyWith(
          fontSize: ScreenUtil().setHeight(60.0),
          fontWeight: FontWeight.w700,
        ),
      ),
    ]),
  );
}
