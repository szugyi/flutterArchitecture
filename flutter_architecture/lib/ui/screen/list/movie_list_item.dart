import 'package:flutter/material.dart';

class MovieListItem extends StatelessWidget {
  MovieListItem({Key key, this.index}) : super(key: key);

  final String index;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.network(
          "https://image.tmdb.org/t/p/w500/betExZlgK0l7CZ9CsCBVcwO1OjL.jpg",
          fit: BoxFit.cover,
          width: double.infinity),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            child: DecoratedBox(
              decoration: const BoxDecoration(color: Colors.black38),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  'Item $index',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: DecoratedBox(
                decoration: const BoxDecoration(color: Colors.black38),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Budget: $index',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.white),
                  ),
                )),
          )
        ],
      ),
    ]);
  }
}
