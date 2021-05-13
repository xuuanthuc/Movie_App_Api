import '/models/movie_model.dart';

abstract class IMoviePopularRepository {
  Future<MoviePopularModel> getMoviePopular();
}
