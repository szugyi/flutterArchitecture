import 'package:flutter/material.dart';
import 'package:flutter_architecture/ui/screen/detail/movie_detail_screen.dart';
import 'package:flutter_architecture/ui/screen/list/movie_list_item.dart';

class MovieListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MovieListScreenState();
  }
}

class MovieListScreenState extends State<MovieListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Movie DB"),
      ),
      body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(10, (index) {
            return GestureDetector(
              child: MovieListItem(index: "$index"),
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MovieDetailScreen(id: "$index")))
              },
            );
          })),
    );
  }
}
