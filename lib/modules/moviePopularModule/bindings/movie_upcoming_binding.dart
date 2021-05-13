import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:movie_app/data/repository/movie_upcoming_repository.dart';
import 'package:movie_app/modules/moviePopularModule/controllers/movie_upcoming_controller.dart';
import 'package:movie_app/modules/moviePopularModule/movie_upcoming_repository_adapter.dart';
import '/data/repository/movie_popular_repository.dart';
import '/data/repository/movie_toprate_repository.dart';
import '/modules/moviePopularModule/controllers/movie_popular_controller.dart';
import '/modules/moviePopularModule/controllers/movie_top_rate_controller.dart';
import '/modules/moviePopularModule/movie_popular_repository_adapter.dart';
import '/modules/moviePopularModule/movie_toprate_repository_adapter.dart';

class MovieUpcomingBinding extends Bindings {
  @override
  void dependencies() {
    print("================================this is weather binding");
    Get.lazyPut<MovieUpcomingController>(() => MovieUpcomingController());
    Get.lazyPut<IMovieUpcomingRepository>(() => MovieUpcomingRepository());
  }
}