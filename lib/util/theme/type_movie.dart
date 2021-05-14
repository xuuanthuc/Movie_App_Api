
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/data/url_api.dart';
import 'package:movie_app/modules/moviePopularModule/controllers/movie_controller.dart';
import 'package:flutter/cupertino.dart';
class Type{
static const POPULAR = 'Popular';
static const TOPRATE = 'Top Rate';
static const UPCOMING = 'Upcoming';
}


MovieController movieController = Get.find();
Widget TypeMovie(String text, int index){
  var moviePopular = movieController.moviesPopular.results![index];
  var movieTopRate = movieController.moviesTopRate.results![index];
  var movieUpcoming = movieController.moviesUpcoming.results![index];
  switch (text) {
    case Type.POPULAR:
      {
        return Image.network('${getImagePosterMovie}${moviePopular.posterPath}',
          fit: BoxFit.cover,);
      }
    case Type.TOPRATE:
      {
        return Image.network('${getImagePosterMovie}${movieTopRate.posterPath}',
          fit: BoxFit.cover,);
      }
    case Type.UPCOMING:
      {
        return Image.network('${getImagePosterMovie}${movieUpcoming.posterPath}',
          fit: BoxFit.cover,);
      }
    default: {
      return Image.asset('assets/images/smoke.png');
    }
  }
}
Widget backPathMovieDetail(String text, int index){
  var moviePopular = movieController.moviesPopular.results![index];
  var movieTopRate = movieController.moviesTopRate.results![index];
  var movieUpcoming = movieController.moviesUpcoming.results![index];

  switch (text) {
    case Type.POPULAR:
      {
        return Image.network('${getImagePosterMovie}${moviePopular.backdropPath}',
          fit: BoxFit.fitHeight,);
      }
    case Type.TOPRATE:
      {
        return Image.network('${getImagePosterMovie}${movieTopRate.backdropPath}',
          fit: BoxFit.fitHeight,);
      }
    case Type.UPCOMING:
      {
        return Image.network('${getImagePosterMovie}${movieUpcoming.backdropPath}',
          fit: BoxFit.fitHeight,);
      }
    default: {
      return Image.asset('assets/images/smoke.png');
    }
  }
}

