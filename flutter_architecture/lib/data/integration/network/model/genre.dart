import 'package:json_annotation/json_annotation.dart';

part 'genre.g.dart';

@JsonSerializable()
class GenreApiModel {
  int id;
  String name;

  GenreApiModel(this.id, this.name);

  factory GenreApiModel.fromJson(Map<String, dynamic> json) => _$GenreApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenreApiModelToJson(this);
}
