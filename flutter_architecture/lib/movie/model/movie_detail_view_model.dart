import 'package:flutter_architecture/core/model/view_model.dart';
import 'package:flutter_architecture/data/service/movie_service_impl.dart';
import 'package:flutter_architecture/domain/model/movie.dart';
import 'package:flutter_architecture/domain/store/movie_store.dart';

MovieDetailViewModel movieDetailViewModelInstance =
    MovieDetailViewModel(movieServiceInstance);

class MovieDetailViewModel implements ViewModel {
  MovieDetailViewModel(this._movieStore);

  MovieStore _movieStore;

  Stream<Movie> get movie => _movieStore.getMovie(0);

  @override
  dispose() {
    // How should we dispose the BehaviorSubject?
  }
}
