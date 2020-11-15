// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'data_config_module.dart';
import '../domain/action/movie_action.dart';
import '../data/integration/network/movie_db_client.dart';
import '../movie/model/movie_detail_view_model.dart';
import '../movie/model/movie_list_view_model.dart';
import '../data/integration/service/movie_service_impl.dart';
import '../domain/store/movie_store.dart';
import 'network_module.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final networkModule = _$NetworkModule();
  final dataConfigModule = _$DataConfigModule();
  gh.factory<MovieStore>(
      () => dataConfigModule.provideMovieStore(get<MovieServiceImpl>()));
  gh.factory<MovieAction>(
      () => dataConfigModule.provideMovieAction(get<MovieServiceImpl>()));
  gh.factory<MovieDetailViewModel>(
      () => MovieDetailViewModel(get<MovieStore>()));
  gh.factory<MovieListViewModel>(
      () => MovieListViewModel(get<MovieAction>(), get<MovieStore>()));

  // Eager singletons must be registered in the right order
  gh.singleton<Dio>(networkModule.provideDio());
  gh.singleton<MovieDbClient>(networkModule.provideMovieDb(get<Dio>()));
  gh.singleton<MovieServiceImpl>(
      dataConfigModule.provideMovieService(get<MovieDbClient>()));
  return get;
}

class _$NetworkModule extends NetworkModule {}

class _$DataConfigModule extends DataConfigModule {}
