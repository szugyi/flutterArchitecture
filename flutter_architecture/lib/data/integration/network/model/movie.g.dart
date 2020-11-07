// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieApiModel _$MovieApiModelFromJson(Map<String, dynamic> json) {
  return MovieApiModel(
    json['adult'] as bool,
    json['backdrop_path'] as String,
    json['budget'] as int,
    (json['genres'] as List)
        ?.map((e) => e == null
            ? null
            : GenreApiModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['homepage'] as String,
    json['id'] as int,
    json['imdb_id'] as String,
    json['original_language'] as String,
    json['original_title'] as String,
    json['overview'] as String,
    (json['popularity'] as num)?.toDouble(),
    json['poster_path'] as String,
    json['release_date'] as String,
    json['revenue'] as int,
    json['runtime'] as int,
    json['status'] as String,
    json['tagline'] as String,
    json['title'] as String,
    json['video'] as bool,
    (json['vote_average'] as num)?.toDouble(),
    json['vote_count'] as int,
  );
}

Map<String, dynamic> _$MovieApiModelToJson(MovieApiModel instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'budget': instance.budget,
      'genres': instance.genres?.map((e) => e?.toJson())?.toList(),
      'homepage': instance.homepage,
      'id': instance.id,
      'imdb_id': instance.imdbId,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'status': instance.status,
      'tagline': instance.tagline,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
