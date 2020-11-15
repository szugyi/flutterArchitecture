import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_architecture/domain/model/movie.dart';
import 'package:flutter_architecture/movie/model/movie_detail_view_model.dart';
import 'package:flutter_gen/gen_l10n/translations.dart';
import 'package:get_it/get_it.dart';

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

    _viewModel = GetIt.I<MovieDetailViewModel>();
    _subscription = _viewModel.movie.listen((value) => setState(() {
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
                  title: Text(_movie?.title ?? "", style: Theme.of(context).primaryTextTheme.headline6),
                  background: _buildImage()),
            ),
          ];
        },
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _buildItem(context, Translations.of(context).movieDetailOriginalTitle(_movie?.originalTitle)),
          _buildItem(context, Translations.of(context).movieDetailReleaseDate(_movie?.releaseDate)),
          _buildItem(context, Translations.of(context).movieDetailGenre(_movie?.genre)),
          _buildItem(context, Translations.of(context).movieDetailBudget(_movie?.budget)),
          _buildItem(context, Translations.of(context).movieDetailRevenue(_movie?.revenue)),
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
      child: Text(text, style: Theme.of(context).textTheme.headline6),
    );
  }
}
