import 'package:flutter_architecture/data/mock/service/mock_movie_service_impl.dart';
import 'package:flutter_architecture/domain/action/movie_action.dart';
import 'package:flutter_architecture/domain/store/movie_store.dart';
import 'package:injectable/injectable.dart';

import '../injector.dart';

@module
abstract class MockDataConfigModule {
  @singleton
  MockMovieServiceImpl provideMovieService() => MockMovieServiceImpl();

  @mock
  MovieAction provideMovieAction(MockMovieServiceImpl service) => service;

  @mock
  MovieStore provideMovieStore(MockMovieServiceImpl service) => service;
}
