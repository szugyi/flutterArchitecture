// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_db_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _MovieDbClient implements MovieDbClient {
  _MovieDbClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://api.themoviedb.org/3/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<SearchResultApiModel> searchMovies(
      {apiKey = "43a7ea280d085bd0376e108680615c7f",
      language = "en-US",
      includeAdult = false,
      query,
      page}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'api_key': apiKey,
      r'language': language,
      r'include_adult': includeAdult,
      r'query': query,
      r'page': page
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/search/movie',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = SearchResultApiModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<MovieApiModel> getMovie(
      {apiKey = "43a7ea280d085bd0376e108680615c7f",
      language = "en-US",
      movieId}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'api_key': apiKey,
      r'language': language
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/movie/$movieId',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = MovieApiModel.fromJson(_result.data);
    return value;
  }
}
