import 'package:flutter/material.dart';

import 'core/flavor.dart';
import 'di/injector.dart';
import 'movie_app.dart';

void main() {
  var config = FlavorConfig(flavor: Flavor.MOCK, color: Colors.deepPurpleAccent, values: FlavorValues(baseUrl: "NONE"));

  configureDependencies(mock.name, config);
  runApp(MovieApp());
}
