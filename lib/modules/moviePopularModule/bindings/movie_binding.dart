import 'package:get/get.dart';

import '/data/repository/movie_repository.dart';
import '/modules/moviePopularModule/controllers/movie_controller.dart';
import '/modules/moviePopularModule/movie_popular_repository_adapter.dart';

class MovieBinding extends Bindings {
  @override
  void dependencies() {
    print("================================this is weather binding");
    Get.lazyPut<MovieController>(() => MovieController());
    Get.lazyPut<IMovieRepository>(() => MovieRepository());
  }
}