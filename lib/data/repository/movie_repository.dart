
import '/data/request.dart';
import '/data/url_api.dart';
import '/models/movie_model.dart';
import '/modules/moviePopularModule/movie_popular_repository_adapter.dart';

final moviePopularApi = '$getMoviePopular';
final movieTopRatedApi = '$getMovieTopRate';
final movieUpcomingApi = '$getMovieUpcoming';


class MovieRepository implements IMovieRepository{
  Request request = Request();

  @override
  Future<MoviePopularModel> getMoviePopular()async {
    // TODO: implement getMoviePopular
    var res = await request.requestApi(method: MethodType.GET, url: moviePopularApi);
    var data = (res as dynamic);

    return MoviePopularModel.fromJson(data);
  }
  Future<MoviePopularModel> getMovieTopRate()async {
    // TODO: implement getMoviePopular
    var res = await request.requestApi(method: MethodType.GET, url: movieTopRatedApi);
    var data = (res as dynamic);
    print(data);
    return MoviePopularModel.fromJson(data);
  }

  Future<MoviePopularModel> getMovieUpcoming()async {
    // TODO: implement getMoviePopular
    var res = await request.requestApi(method: MethodType.GET, url: movieUpcomingApi);
    var data = (res as dynamic);
    print(data);
    return MoviePopularModel.fromJson(data);
  }

}