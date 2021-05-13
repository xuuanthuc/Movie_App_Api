import 'package:get/get.dart';
import '/data/repository/movie_popular_repository.dart';
import '/models/movie_model.dart';
import '/modules/moviePopularModule/movie_popular_repository_adapter.dart';
import '/modules/moviePopularModule/movie_toprate_repository_adapter.dart';

class MovieTopRateController extends GetxController{
  // var movies = List<MoviePopularModel>();
  MoviePopularModel movies = MoviePopularModel();
  final IMovieTopRateRepository moviePopularRepository = Get.find();
  var isLoading = false;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMovieTopRate();
  }
  Results findById(int id){
    return movies.results!.firstWhere((movie) => movie.id == id);
  }
  void getMovieTopRate() async{
    isLoading = true;
    movies = await moviePopularRepository.getMovieTopRate();
    isLoading = false;
    update();
  }
}
