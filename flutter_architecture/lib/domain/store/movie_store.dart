import 'package:flutter_architecture/domain/model/movie.dart';

abstract class MovieStore {
  Stream<List<Movie>> getMovies();

  Stream<Movie> getMovie(int id);
}
