
const demoApiUrl = "/api/location/search/?query=Chicago";
const getLocalUrl = "/api/location/search/?query";
const fetchWeatherUrl = "/api/location/";

const apiKey = '48b494887f537657b690bf872ed821b0';
const getMoviePopular = 'movie/popular?api_key=$apiKey&language=en-US&page=1';
const getMovieTopRate = 'movie/top_rated?api_key=$apiKey&language=en-US&page=1';
const getImagePosterMovie = 'https://image.tmdb.org/t/p/w500';
//Môi trường dev
class DevEnvironment{
  final baseUrl = "https://www.metaweather.com";
  final receiveTimeout = 2 * 60 * 1000;
  final connectTimeout = 2 * 60 * 1000;
}

class MovieEnvironment{
  final baseUrl = "https://api.themoviedb.org/3/";
  final receiveTimeout = 2 * 60 * 1000;
  final connectTimeout = 2 * 60 * 1000;
}

final environment = MovieEnvironment();

enum MethodType {GET, POST}
