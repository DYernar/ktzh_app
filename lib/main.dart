import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ktzh_app/navigation/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(App());
}
