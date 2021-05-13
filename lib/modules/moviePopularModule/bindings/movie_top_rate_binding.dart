import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import '/data/repository/movie_popular_repository.dart';
import '/data/repository/movie_toprate_repository.dart';
import '/modules/moviePopularModule/controllers/movie_popular_controller.dart';
import '/modules/moviePopularModule/controllers/movie_top_rate_controller.dart';
import '/modules/moviePopularModule/movie_popular_repository_adapter.dart';
import '/modules/moviePopularModule/movie_toprate_repository_adapter.dart';

class MovieTopRateBinding extends Bindings {
  @override
  void dependencies() {
    print("================================this is weather binding");
    Get.lazyPut<MovieTopRateController>(() => MovieTopRateController());
    Get.lazyPut<IMovieTopRateRepository>(() => MovieTopRateRepository());
  }
}