import 'package:get/get.dart';
import '/data/repository/movie_popular_repository.dart';
import '/models/movie_model.dart';
import '/modules/moviePopularModule/movie_popular_repository_adapter.dart';
import '/modules/moviePopularModule/movie_toprate_repository_adapter.dart';

class MoviePopularController extends GetxController{
  // var movies = List<MoviePopularModel>();
  MoviePopularModel movies = MoviePopularModel();
  final IMoviePopularRepository moviePopularRepository = Get.find();
  var id;
  var isLoading = false;
  late int index;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMoviePopular();
  }
  Results findById(int id){
    return movies.results!.firstWhere((movie) => movie.id == id);
  }

  void getMoviePopular()async{
    isLoading = true;
    movies = await moviePopularRepository.getMoviePopular();
    isLoading = false;
    update();
  }
}
