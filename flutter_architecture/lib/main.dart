import 'package:flutter/material.dart';
import 'package:flutter_architecture/ui/details.dart';
import 'package:flutter_architecture/ui/home.dart';

void main() {
  runApp(MyApp());
}

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
      },
    );
  }
}
