import 'package:flutter/material.dart';

import 'di/injector.dart';
import 'movie_app.dart';

void main() {
  configureDependencies();
  runApp(MovieApp());
}
