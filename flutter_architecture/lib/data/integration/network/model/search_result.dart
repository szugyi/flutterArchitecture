import 'package:json_annotation/json_annotation.dart';

import 'movie_list_result.dart';

part 'search_result.g.dart';

@JsonSerializable(explicitToJson: true)
class SearchResultApiModel {
  int page;
  List<MovieListResultApiModel> results;

  @JsonKey(name: 'total_results')
  int totalResults;

  @JsonKey(name: 'total_pages')
  int totalPages;

  SearchResultApiModel(this.page, this.results, this.totalResults, this.totalPages);

  factory SearchResultApiModel.fromJson(Map<String, dynamic> json) =>
      _$SearchResultApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultApiModelToJson(this);
}
