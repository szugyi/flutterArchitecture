// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResultApiModel _$SearchResultApiModelFromJson(Map<String, dynamic> json) {
  return SearchResultApiModel(
    json['page'] as int,
    (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : MovieListResultApiModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['total_results'] as int,
    json['total_pages'] as int,
  );
}

Map<String, dynamic> _$SearchResultApiModelToJson(
        SearchResultApiModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results?.map((e) => e?.toJson())?.toList(),
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
    };
