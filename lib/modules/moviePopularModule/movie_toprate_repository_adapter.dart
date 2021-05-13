import '/models/movie_model.dart';

abstract class IMovieTopRateRepository {
  Future<MoviePopularModel> getMovieTopRate();
}
