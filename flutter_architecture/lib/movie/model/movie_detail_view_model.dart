import 'package:flutter_architecture/core/model/view_model.dart';
import 'package:flutter_architecture/domain/model/movie.dart';
import 'package:flutter_architecture/domain/store/movie_store.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class MovieDetailViewModel implements ViewModel {
  @factoryMethod
  MovieDetailViewModel(this._movieStore);

  MovieStore _movieStore;

  var _movie = PublishSubject<Movie>();

  Stream<Movie> get movie => _movie;

  Future<void> loadMovie(int id) async {
    var currentMovie = await _movieStore.getMovie(id).first;
    _movie.add(currentMovie);
  }

  @override
  dispose() {
    // How should we dispose the BehaviorSubject?
  }
}
