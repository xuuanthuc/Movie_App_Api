import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/data/url_api.dart';
import 'package:movie_app/util/theme/type_movie.dart';
import '/modules/moviePopularModule/controllers/movie_controller.dart';

import '/util/common/screen_util.dart';

class MovieListTile extends StatelessWidget {
  int index;
  String type;
  MovieListTile({required this.index, required this.type});
  MovieController moviePopularController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: width(15)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius(10)),
        child: Container(
          width: width(133),
          child: TypeMovie(type, index),
        ),
      ),
    );
  }
}

