import 'package:flutter_architecture/core/model/view_model.dart';
import 'package:flutter_architecture/data/integration/service/movie_service_impl.dart';
import 'package:flutter_architecture/domain/model/movie.dart';
import 'package:flutter_architecture/domain/store/movie_store.dart';
import 'package:rxdart/rxdart.dart';

MovieDetailViewModel movieDetailViewModelInstance =
    MovieDetailViewModel(movieServiceInstance);

class MovieDetailViewModel implements ViewModel {
  MovieStore _movieStore;

  MovieDetailViewModel(this._movieStore);

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
