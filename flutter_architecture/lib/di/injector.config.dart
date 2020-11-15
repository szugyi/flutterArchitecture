// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'integration/data_config_module.dart';
import '../core/flavor.dart';
import 'mock/data_config_module.dart';
import '../data/mock/service/mock_movie_service_impl.dart';
import '../domain/action/movie_action.dart';
import '../data/integration/network/movie_db_client.dart';
import '../movie/model/movie_detail_view_model.dart';
import '../movie/model/movie_list_view_model.dart';
import '../data/integration/service/movie_service_impl.dart';
import '../domain/store/movie_store.dart';
import 'integration/network_module.dart';

/// Environment names
const _mock = 'mock';
const _integration = 'integration';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final networkModule = _$NetworkModule();
  final mockDataConfigModule = _$MockDataConfigModule();
  final dataConfigModule = _$DataConfigModule();
  gh.factory<MovieAction>(
      () =>
          mockDataConfigModule.provideMovieAction(get<MockMovieServiceImpl>()),
      registerFor: {_mock});
  gh.factory<MovieStore>(
      () => dataConfigModule.provideMovieStore(get<MovieServiceImpl>()),
      registerFor: {_integration});
  gh.factory<MovieStore>(
      () => mockDataConfigModule.provideMovieStore(get<MockMovieServiceImpl>()),
      registerFor: {_mock});
  gh.factory<MovieAction>(
      () => dataConfigModule.provideMovieAction(get<MovieServiceImpl>()),
      registerFor: {_integration});
  gh.factory<MovieDetailViewModel>(
      () => MovieDetailViewModel(get<MovieStore>()));
  gh.factory<MovieListViewModel>(
      () => MovieListViewModel(get<MovieAction>(), get<MovieStore>()));

  // Eager singletons must be registered in the right order
  gh.singleton<Dio>(networkModule.provideDio());
  gh.singleton<MockMovieServiceImpl>(
      mockDataConfigModule.provideMovieService());
  gh.singleton<MovieDbClient>(
      networkModule.provideMovieDb(get<Dio>(), get<FlavorConfig>()));
  gh.singleton<MovieServiceImpl>(
      dataConfigModule.provideMovieService(get<MovieDbClient>()));
  return get;
}

class _$NetworkModule extends NetworkModule {}

class _$MockDataConfigModule extends MockDataConfigModule {}

class _$DataConfigModule extends DataConfigModule {}
