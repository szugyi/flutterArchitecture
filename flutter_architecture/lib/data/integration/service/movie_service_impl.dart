import 'package:dio/dio.dart';
import 'package:flutter_architecture/data/integration/mapper/movie_mapper.dart';
import 'package:flutter_architecture/data/integration/network/movie_db_client.dart';
import 'package:flutter_architecture/domain/action/movie_action.dart';
import 'package:flutter_architecture/domain/model/movie.dart';
import 'package:flutter_architecture/domain/store/movie_store.dart';
import 'package:rxdart/rxdart.dart';

Dio dioInstance = Dio();
MovieServiceImpl movieServiceInstance =
    MovieServiceImpl(MovieDbClient(dioInstance));

class MovieServiceImpl implements MovieAction, MovieStore {
  var _movies = BehaviorSubject<List<Movie>>();

  MovieDbClient _client;

  MovieServiceImpl(this._client);

  @override
  Stream<Movie> getMovie(int id) {
    return _movies.stream
        .map((movieList) => movieList.firstWhere((item) => item.id == id));
  }

  @override
  Stream<List<Movie>> getMovies() {
    return _movies;
  }

  @override
  Future<void> loadMovies() async {
    var result = await _client.searchMovies(query: "the", page: 1);

    var movieListFutures = result.results.map((movieListResult) async =>
        await _client.getMovie(movieId: movieListResult.id));

    var movieList = (await Future.wait(movieListFutures))
        .map((movie) => movie.toDomainModel())
        .toList();

    _movies.add(movieList);
  }
}
