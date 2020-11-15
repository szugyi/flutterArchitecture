import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'core/flavor.dart';
import 'di/injector.dart';
import 'movie_app.dart';

void main() {
  var config = FlavorConfig(
      flavor: Flavor.DEV, color: Colors.green, values: FlavorValues(baseUrl: "https://api.themoviedb.org/3/"));

  configureDependencies(integration.name, config);
  runApp(MovieApp());
}
