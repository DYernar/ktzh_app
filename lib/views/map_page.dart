import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:http/http.dart';
import 'package:latlong/latlong.dart';

class MapPage extends StatefulWidget {
  MapPage({Key key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<Polyline> routes = [];
  List<Polyline> reachedPoly = [];
  List<Marker> productLocation = [];
  @override
  void initState() {
    getPoints();
    super.initState();
  }

// Zhezkazgan
  void getPoints() async {
    addPoly("Zhezkazgan", "Astana");
    addPoly("Kostanay", "Kokshetau");
    addPoly("Aktobe", "Taraz");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new FlutterMap(
        options: new MapOptions(
          center: LatLng(51.169392, 71.449074),
          maxZoom: 10.0,
          zoom: 5,
        ),
        layers: [
          new TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          PolylineLayerOptions(polylines: routes),
          PolylineLayerOptions(polylines: reachedPoly),
          MarkerLayerOptions(markers: productLocation),
        ],
      ),
    );
  }

  Future<List<LatLng>> getByCityNames(String initial, String dest) async {
    var response = await get(
        "https://www.mapquestapi.com/directions/v2/route?key=njeG07DJ0pjM2nKnsISyABs8X63FtodG&to=$initial&from=$dest");
    var routeData = json.decode(utf8.decode(response.bodyBytes));
    List<LatLng> latlngs = [];

    for (var legs in routeData['route']['legs']) {
      for (var obj in legs['maneuvers']) {
        latlngs.add(LatLng(obj['startPoint']['lat'], obj['startPoint']['lng']));
      }
    }

    return latlngs;
  }

  Marker buildMarker(LatLng p) {
    return Marker(
      point: p,
      height: ScreenUtil().setHeight(100.0),
      width: ScreenUtil().setHeight(100.0),
      builder: (context) {
        return Container(
          width: ScreenUtil().setHeight(100),
          height: ScreenUtil().setHeight(100),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(
              ScreenUtil().setHeight(50.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: ScreenUtil().setHeight(4),
              ),
            ],
          ),
          child: Center(
            child: Text(
              "100\nkm/h",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(25.0),
              ),
            ),
          ),
        );
      },
    );
  }

  addPoly(String init, String dest) async {
    var za = await getByCityNames("$init", "$dest");

    routes.add(Polyline(
      points: za,
      color: Colors.redAccent.withOpacity(0.8),
      strokeWidth: ScreenUtil().setHeight(10),
    ));
    List<LatLng> reached = [];

    for (int i = 0; i < za.length / 2; i++) {
      reached.add(za[i]);
    }

    reachedPoly.add(Polyline(
      points: reached,
      color: Colors.blue.withOpacity(0.9),
      strokeWidth: ScreenUtil().setHeight(10),
    ));

    if (reached.length > 0) {
      productLocation.add(buildMarker(reached[reached.length - 1]));
    }
  }
}
