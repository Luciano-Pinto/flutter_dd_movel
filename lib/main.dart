import 'package:dd_movel/abas/aba_material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final ThemeData kIOSTheme = ThemeData(
    primarySwatch: Colors.orange,
    primaryColor: Colors.grey[100],
    primaryColorBrightness: Brightness.light);

final ThemeData kAndroidTheme = ThemeData(
    primarySwatch: Colors.purple, accentColor: Colors.orangeAccent[400]);

void main() {
  runApp(new DiarioDigitalMobile());
}

class DiarioDigitalMobile extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: defaultTargetPlatform == TargetPlatform.iOS
          ? kIOSTheme
          : kAndroidTheme,
      home: getAbas(_scaffoldKey),
    );
  }
}
