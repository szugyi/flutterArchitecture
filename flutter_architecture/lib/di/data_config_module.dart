import 'package:flutter_architecture/data/integration/network/movie_db_client.dart';
import 'package:flutter_architecture/data/integration/service/movie_service_impl.dart';
import 'package:flutter_architecture/domain/action/movie_action.dart';
import 'package:flutter_architecture/domain/store/movie_store.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DataConfigModule {
  @singleton
  MovieServiceImpl provideMovieService(MovieDbClient client) => MovieServiceImpl(client);

  MovieAction provideMovieAction(MovieServiceImpl service) => service;

  MovieStore provideMovieStore(MovieServiceImpl service) => service;
}
