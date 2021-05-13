import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/data/url_api.dart';
import '/modules/moviePopularModule/controllers/movie_popular_controller.dart';

import '/util/common/screen_util.dart';
class MovieListTile extends StatelessWidget {
  int index;
  MovieListTile({required this.index});
  MoviePopularController moviePopularController = Get.find();
  @override
  Widget build(BuildContext context) {
    var moviePopular = moviePopularController.movies.results![index];
    return Padding(
      padding:  EdgeInsets.only(right: width(15)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius(10)),
        child: Container(
          width: width(133),
          child: Image.network('${getImagePosterMovie}${moviePopular.posterPath}', fit: BoxFit.cover ,),
        ),
      ),
    );
  }
}
