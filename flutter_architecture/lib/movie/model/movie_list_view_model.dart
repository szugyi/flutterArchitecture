import 'package:flutter_architecture/core/model/view_model.dart';
import 'package:flutter_architecture/domain/action/movie_action.dart';
import 'package:flutter_architecture/domain/model/movie.dart';
import 'package:flutter_architecture/domain/store/movie_store.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieListViewModel implements ViewModel {
  @factoryMethod
  MovieListViewModel(this._movieAction, this._movieStore);

  MovieAction _movieAction;
  MovieStore _movieStore;

  Stream<List<Movie>> get movies => _movieStore.getMovies();

  Future<void> loadMovies() async {
    await _movieAction.loadMovies();
  }

  @override
  dispose() {
    // How should we dispose the BehaviorSubject?
  }
}
