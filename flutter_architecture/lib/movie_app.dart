import 'package:flutter/material.dart';
import 'package:flutter_architecture/ui/screen/detail/movie_detail_screen.dart';
import 'package:flutter_architecture/ui/screen/list/movie_list_screen.dart';

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "The Movie DB",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => MovieListScreen()
      },
    );
  }
}
