import 'package:flutter/material.dart';
import 'package:flutter_architecture/movie/ui/movie_list_screen.dart';
import 'package:flutter_gen/gen_l10n/translations.dart';

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: Translations.localizationsDelegates,
      supportedLocales: Translations.supportedLocales,
      title: "The Movie DB",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      routes: {"/": (context) => MovieListScreen()},
    );
  }
}
