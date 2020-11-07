import 'package:flutter/material.dart';
import 'package:flutter_architecture/domain/model/movie.dart';
import 'package:flutter_gen/gen_l10n/translations.dart';

class MovieListItem extends StatelessWidget {
  MovieListItem({Key key, this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.network(movie.posterImage, fit: BoxFit.cover, width: double.infinity),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.black38),
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  movie.title,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.black38),
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    Translations.of(context).movieListBudget(movie.budget),
                    style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white),
                  ),
                )),
          )
        ],
      ),
    ]);
  }
}
