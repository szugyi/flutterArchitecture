import 'package:faker/faker.dart';
import 'package:flutter_architecture/domain/action/movie_action.dart';
import 'package:flutter_architecture/domain/model/movie.dart';
import 'package:flutter_architecture/domain/store/movie_store.dart';
import 'package:rxdart/rxdart.dart';

MovieServiceImpl movieServiceInstance = MovieServiceImpl();

class MovieServiceImpl implements MovieAction, MovieStore {
  final _faker = Faker();

  var _movies = BehaviorSubject<List<Movie>>();

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
    await Future.delayed(Duration(seconds: 3));

    List<Movie> generatedMovies = List();

    for (int i = 0; i < 10; i++) {
      generatedMovies.add(Movie(
          id: i,
          title: _faker.lorem.sentence(),
          originalTitle: _faker.lorem.word(),
          budget: _faker.randomGenerator.decimal(scale: 100000),
          revenue: _faker.randomGenerator.decimal(scale: 100000),
          releaseDate:
              _faker.date.dateTime(minYear: 1980, maxYear: 2020).toString(),
          genre: _faker.lorem.word(),
          coverImage:
              "https://image.tmdb.org/t/p/w500/f2rYRh4TmhHZutQR2wL2tm97G6I.jpg",
          posterImage:
              "https://image.tmdb.org/t/p/w500/betExZlgK0l7CZ9CsCBVcwO1OjL.jpg"));
    }

    _movies.value = generatedMovies;
  }

  void dispose() {
    _movies.close();
  }
}
