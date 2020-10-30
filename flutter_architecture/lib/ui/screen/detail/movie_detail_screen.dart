import 'package:flutter/material.dart';

class MovieDetailScreen extends StatefulWidget {
  MovieDetailScreen({Key key, this.id}) : super(key: key);

  final String id;

  @override
  State<StatefulWidget> createState() {
    return new MovieDetailScreenState();
  }
}

class MovieDetailScreenState extends State<MovieDetailScreen> {
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
                  title: Text("Movie title",
                      style: Theme.of(context).primaryTextTheme.headline6),
                  background: Image.network(
                    "https://image.tmdb.org/t/p/w500/f2rYRh4TmhHZutQR2wL2tm97G6I.jpg",
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _buildItem(context, "Original title: "),
          _buildItem(context, "Release date: "),
          _buildItem(context, "Genre: "),
          _buildItem(context, "Budget: "),
          _buildItem(context, "Revenue: "),
        ]),
      ),
    );
  }

  Padding _buildItem(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text, style: Theme.of(context).textTheme.headline6),
    );
  }
}
