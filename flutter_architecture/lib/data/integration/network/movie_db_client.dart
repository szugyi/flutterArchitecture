import 'package:dio/dio.dart';
import 'package:flutter_architecture/data/integration/network/model/movie.dart';
import 'package:retrofit/retrofit.dart';

import 'model/search_result.dart';

part 'movie_db_client.g.dart';

@RestApi()
abstract class MovieDbClient {
  factory MovieDbClient(Dio dio, {String baseUrl}) = _MovieDbClient;

  @GET("/search/movie")
  Future<SearchResultApiModel> searchMovies(
      {@Query("api_key") String apiKey = "43a7ea280d085bd0376e108680615c7f",
      @Query("language") String language = "en-US",
      @Query("include_adult") bool includeAdult = false,
      @Query("query") String query,
      @Query("page") int page});

  @GET("/movie/{movie_id}")
  Future<MovieApiModel> getMovie(
      {@Query("api_key") String apiKey = "43a7ea280d085bd0376e108680615c7f",
      @Query("language") String language = "en-US",
      @Path("movie_id") int movieId});
}
