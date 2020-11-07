import 'package:json_annotation/json_annotation.dart';

import 'genre.dart';

part 'movie.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieApiModel {
  bool adult;
  @JsonKey(name: 'backdrop_path')
  String backdropPath;
  int budget;
  List<GenreApiModel> genres;
  String homepage;
  int id;
  @JsonKey(name: 'imdb_id')
  String imdbId;
  @JsonKey(name: 'original_language')
  String originalLanguage;
  @JsonKey(name: 'original_title')
  String originalTitle;
  String overview;
  double popularity;
  @JsonKey(name: 'poster_path')
  String posterPath;
  @JsonKey(name: 'release_date')
  String releaseDate;
  int revenue;
  int runtime;
  String status;
  String tagline;
  String title;
  bool video;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  @JsonKey(name: 'vote_count')
  int voteCount;

  MovieApiModel(
      this.adult,
      this.backdropPath,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount);

  factory MovieApiModel.fromJson(Map<String, dynamic> json) => _$MovieApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieApiModelToJson(this);
}
