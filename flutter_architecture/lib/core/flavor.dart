import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/utils/string_utils.dart';

enum Flavor { MOCK, DEV, PROD }

class FlavorValues {
  FlavorValues({@required this.baseUrl});

  final String baseUrl;
}

class FlavorConfig {
  final Flavor flavor;
  final Color color;
  final String name;
  final FlavorValues values;

  factory FlavorConfig({@required Flavor flavor, Color color: Colors.blue, @required FlavorValues values}) {
    return FlavorConfig._internal(flavor, color, StringUtils.enumName(flavor.toString()), values);
  }

  FlavorConfig._internal(this.flavor, this.color, this.name, this.values);

  bool isProduction() => this.flavor == Flavor.PROD;

  bool isDevelopment() => this.flavor == Flavor.DEV;

  bool isMock() => this.flavor == Flavor.MOCK;
}
