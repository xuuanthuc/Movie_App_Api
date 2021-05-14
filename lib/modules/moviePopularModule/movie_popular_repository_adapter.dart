import '/models/movie_model.dart';

abstract class IMovieRepository {
  Future<MoviePopularModel> getMoviePopular();
  Future<MoviePopularModel> getMovieTopRate();
  Future<MoviePopularModel> getMovieUpcoming();
}
