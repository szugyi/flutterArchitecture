// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenreApiModel _$GenreApiModelFromJson(Map<String, dynamic> json) {
  return GenreApiModel(
    json['id'] as int,
    json['name'] as String,
  );
}

Map<String, dynamic> _$GenreApiModelToJson(GenreApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
