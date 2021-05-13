import 'dart:convert';

import 'package:dio/dio.dart';
import '/data/request.dart';
import '/data/url_api.dart';
import '/models/movie_model.dart';
import '/modules/moviePopularModule/movie_popular_repository_adapter.dart';

final moviePopularApi = '$getMoviePopular';
final movieTopRatedApi = '$getMovieTopRate';

class MoviePopularRepository implements IMoviePopularRepository{
  Request request = Request();

  @override
  Future<MoviePopularModel> getMoviePopular()async {
    // TODO: implement getMoviePopular
    var res = await request.requestApi(method: MethodType.GET, url: moviePopularApi);
      var data = (res as dynamic);

      return MoviePopularModel.fromJson(data);
  }


  //
  // List<MoviePopularModel> parseMovies(String responseBody) {
  //   final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  //
  //   return parsed.map<MoviePopularModel>((json) => MoviePopularModel.fromJson(json)).toList();
  // }

}