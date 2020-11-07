import 'package:flutter_architecture/data/integration/network/model/movie.dart';
import 'package:flutter_architecture/data/integration/network/model/movie_list_result.dart';
import 'package:flutter_architecture/domain/model/movie.dart';

extension MovieListResultMapper on MovieListResultApiModel {
  Movie toDomainModel() => Movie(
      id: this.id,
      title: this.title,
      originalTitle: this.originalTitle,
      genre: null,
      budget: 0.0,
      revenue: 0.0,
      posterImage: "https://image.tmdb.org/t/p/w500" + this.posterPath,
      coverImage: "https://image.tmdb.org/t/p/w500" + this.backdropPath,
      releaseDate: this.releaseDate);
}

extension MovieMapper on MovieApiModel {
  Movie toDomainModel() => Movie(
      id: this.id,
      title: this.title,
      originalTitle: this.originalTitle,
      genre: this.genres[0]?.name,
      budget: this.budget.toDouble(),
      revenue: this.revenue.toDouble(),
      posterImage: "https://image.tmdb.org/t/p/w500" + this.posterPath,
      coverImage: "https://image.tmdb.org/t/p/w500" + this.backdropPath,
      releaseDate: this.releaseDate);
}
