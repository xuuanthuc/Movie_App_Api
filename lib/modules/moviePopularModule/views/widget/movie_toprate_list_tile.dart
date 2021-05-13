import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_app/data/url_api.dart';

import '/modules/moviePopularModule/controllers/movie_top_rate_controller.dart';

import '/util/common/screen_util.dart';


class MovieTopRateListTile extends StatelessWidget {
  int index;
  MovieTopRateListTile({required this.index});
  MovieTopRateController movieTopRateController = Get.find();
  @override
  Widget build(BuildContext context) {
    var movieTopRate = movieTopRateController.movies.results![index];
    return Padding(
      padding: EdgeInsets.only(right: width(15)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius(10)),
        child: Container(
          width: width(133),
          child: Image.network('${getImagePosterMovie}${movieTopRate.posterPath}', fit: BoxFit.cover ,),
        ),
      ),
    );
  }
}
