import 'package:flutter/material.dart';
import 'package:flutter_architecture/ui/details.dart';
import 'package:flutter_architecture/ui/home.dart';
import 'package:flutter_architecture/ui/qr/firebase_ml_vision_reader.dart';
import 'package:flutter_architecture/ui/qr/qr_reader.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => HomeScreen(title: 'Flutter Demo Home Page'),
        DetailsScreen.routeName: (context) => DetailsScreen(),
        QrCodeReaderScreen.routeName: (context) => QrCodeReaderScreen(),
        MaterialBarcodeScanner.routeName: (context) => MaterialBarcodeScanner(),
      },
    );
  }
}