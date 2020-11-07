import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_architecture/domain/model/movie.dart';
import 'package:flutter_architecture/movie/model/movie_detail_view_model.dart';

class MovieDetailScreen extends StatefulWidget {
  MovieDetailScreen({Key key, this.id}) : super(key: key);

  final int id;

  @override
  State<StatefulWidget> createState() {
    return new MovieDetailScreenState();
  }
}

class MovieDetailScreenState extends State<MovieDetailScreen> {
  MovieDetailViewModel _viewModel;
  Movie _movie;
  StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();

    _viewModel = movieDetailViewModelInstance;
    _subscription = _viewModel.movie.listen((value) =>
        setState(() {
          _movie = value;
        }));


    _viewModel.loadMovie(widget.id);
  }

  @override
  void dispose() {
    _subscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: true,
              snap: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  title: Text(_movie?.title ?? "",
                      style: Theme
                          .of(context)
                          .primaryTextTheme
                          .headline6),
                  background: _buildImage()),
            ),
          ];
        },
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _buildItem(context, "Original title: ${_movie?.originalTitle}"),
          _buildItem(context, "Release date: ${_movie?.releaseDate}"),
          _buildItem(context, "Genre: ${_movie?.genre}"),
          _buildItem(context, "Budget: ${_movie?.budget}"),
          _buildItem(context, "Revenue: ${_movie?.revenue}"),
        ]),
      ),
    );
  }

  Image _buildImage() {
    if (_movie?.coverImage != null) {
      return Image.network(
        _movie?.coverImage,
        fit: BoxFit.cover,
      );
    }

    return null;
  }

  Padding _buildItem(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text, style: Theme
          .of(context)
          .textTheme
          .headline6),
    );
  }
}
