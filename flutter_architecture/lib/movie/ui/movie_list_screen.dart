import 'package:flutter/material.dart';
import 'package:flutter_architecture/domain/model/movie.dart';
import 'package:flutter_architecture/movie/model/movie_list_view_model.dart';
import 'package:flutter_architecture/movie/ui/movie_detail_screen.dart';
import 'package:flutter_architecture/movie/ui/widget/movie_list_item.dart';
import 'package:flutter_gen/gen_l10n/translations.dart';
import 'package:get_it/get_it.dart';

class MovieListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MovieListScreenState();
  }
}

class MovieListScreenState extends State<MovieListScreen> {
  MovieListViewModel _viewModel;

  @override
  void initState() {
    super.initState();

    _viewModel = GetIt.I<MovieListViewModel>();
    _viewModel.loadMovies();
  }

  @override
  void dispose() {
    _viewModel.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Translations.of(context).movieListTitle),
        ),
        body: StreamBuilder(
            stream: _viewModel.movies,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text(Translations.of(context).movieListError));
              } else if (snapshot.data == null) {
                return Center(child: CircularProgressIndicator());
              } else {
                return _buildList(context, snapshot.data);
              }
            }));
  }

  GridView _buildList(BuildContext context, List<Movie> movies) {
    return GridView.count(
        crossAxisCount: 2,
        children: movies.map((movie) {
          return GestureDetector(
            child: MovieListItem(movie: movie),
            onTap: () =>
                {Navigator.of(context).push(MaterialPageRoute(builder: (context) => MovieDetailScreen(id: movie.id)))},
          );
        }).toList());
  }
}
