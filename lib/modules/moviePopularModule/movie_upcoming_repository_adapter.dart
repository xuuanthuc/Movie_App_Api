import '/models/movie_model.dart';

abstract class IMovieUpcomingRepository {
  Future<MoviePopularModel> getMovieUpcoming();
}
