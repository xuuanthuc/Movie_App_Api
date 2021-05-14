import 'package:get/get.dart';
import 'package:movie_app/util/theme/type_movie.dart';

import '/models/movie_model.dart';
import '/modules/moviePopularModule/movie_popular_repository_adapter.dart';

class MovieController extends GetxController {
  // var movies = List<MoviePopularModel>();
  MoviePopularModel moviesPopular = MoviePopularModel();
  MoviePopularModel moviesTopRate = MoviePopularModel();
  MoviePopularModel moviesUpcoming = MoviePopularModel();
  final IMovieRepository movieRepository = Get.find();
  var id;
  var isLoading = false;
  late int index;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMoviePopular();
    getMovieTopRate();
    getMovieUpcoming();
  }

  Results findByIdPopular(int id) {
    return moviesPopular.results!.firstWhere((movie) => movie.id == id);
  }

  Results findByIdTopRate(int id) {
    return moviesPopular.results!.firstWhere((movie) => movie.id == id);
  }

  Results findByIdUpcoming(int id) {
    return moviesPopular.results!.firstWhere((movie) => movie.id == id);
  }

  Results findById(int id, String type) {
    if (type == Type.POPULAR) {
      return moviesPopular.results!.firstWhere((movie) => movie.id == id);
    } else if (type == Type.TOPRATE) {
      return moviesTopRate.results!.firstWhere((movie) => movie.id == id);
    } else if (type == Type.UPCOMING) {
      return moviesUpcoming.results!.firstWhere((movie) => movie.id == id);
    } else {
    return moviesUpcoming.results!.firstWhere((movie) => movie.id == id);
    }
  }

  void getMoviePopular() async {
    isLoading = true;
    moviesPopular = await movieRepository.getMoviePopular();
    isLoading = false;
    update();
  }

  void getMovieTopRate() async {
    isLoading = true;
    moviesTopRate = await movieRepository.getMovieTopRate();
    isLoading = false;
    update();
  }

  void getMovieUpcoming() async {
    isLoading = true;
    moviesUpcoming = await movieRepository.getMovieUpcoming();
    isLoading = false;
    update();
  }
}
