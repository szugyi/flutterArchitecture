import 'package:dio/dio.dart';
import 'package:flutter_architecture/core/flavor.dart';
import 'package:flutter_architecture/data/integration/network/movie_db_client.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @singleton
  Dio provideDio() => Dio();

  @singleton
  MovieDbClient provideMovieDb(Dio dio, FlavorConfig flavorConfig) =>
      MovieDbClient(dio, baseUrl: flavorConfig.values.baseUrl);
}
