import 'package:json_annotation/json_annotation.dart';

part 'movie_list_result.g.dart';

@JsonSerializable()
class MovieListResultApiModel {
  @JsonKey(name: 'poster_path')
  String posterPath;
  bool adult;
  String overview;
  @JsonKey(name: 'release_date')
  String releaseDate;
  @JsonKey(name: 'genre_ids')
  List<int> genreIds;
  int id;
  @JsonKey(name: 'original_title')
  String originalTitle;
  @JsonKey(name: 'original_language')
  String originalLanguage;
  String title;
  @JsonKey(name: 'backdrop_path')
  String backdropPath;
  double popularity;
  @JsonKey(name: 'vote_count')
  int voteCount;
  bool video;
  @JsonKey(name: 'vote_average')
  double voteAverage;

  MovieListResultApiModel(
      this.posterPath,
      this.adult,
      this.overview,
      this.releaseDate,
      this.genreIds,
      this.id,
      this.originalTitle,
      this.originalLanguage,
      this.title,
      this.backdropPath,
      this.popularity,
      this.voteCount,
      this.video,
      this.voteAverage);

  factory MovieListResultApiModel.fromJson(Map<String, dynamic> json) =>
      _$MovieListResultApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListResultApiModelToJson(this);
}
