import 'package:get/get.dart';
import 'package:movie_app/modules/moviePopularModule/movie_upcoming_repository_adapter.dart';
import '/data/repository/movie_popular_repository.dart';
import '/models/movie_model.dart';
import '/modules/moviePopularModule/movie_popular_repository_adapter.dart';
import '/modules/moviePopularModule/movie_toprate_repository_adapter.dart';

class MovieUpcomingController extends GetxController{
  // var movies = List<MoviePopularModel>();
  MoviePopularModel movies = MoviePopularModel();
  final IMovieUpcomingRepository movieUpcomingRepository = Get.find();
  var isLoading = false;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMovieUpcoming();
  }
  Results findById(int id){
    return movies.results!.firstWhere((movie) => movie.id == id);
  }
  void getMovieUpcoming() async{
    isLoading = true;
    movies = await movieUpcomingRepository.getMovieUpcoming();
    isLoading = false;
    update();
  }
}
