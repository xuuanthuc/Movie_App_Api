import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/util/theme/type_movie.dart';
import '/modules/moviePopularModule/controllers/movie_controller.dart';
import '/util/common/screen_util.dart';

import 'deltail_movie_popular.dart';
import 'movie_list_tile.dart';
class ShowAll extends StatelessWidget {
  MovieController _moviePopularController = Get.find();
  String title;
  ShowAll({required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(title, style: TextStyle(color: Colors.redAccent),),
      ),
      body: Container(
        padding: EdgeInsets.only(left: width(20)),
        color: Colors.white,
        child: GetBuilder<MovieController>(
          init: _moviePopularController,
          builder: (context) => _moviePopularController.isLoading
              ? CircularProgressIndicator()
              : Container(
            child: GridView.builder(
              itemBuilder: (_, index) => GestureDetector(
                onTap:(){
                  if(title == Type.POPULAR){
                    var movieData = _moviePopularController.moviesPopular.results![index];
                    Get.to(DetailMovie(type: Type.POPULAR,), arguments: movieData.id,);
                  }
                  else if(title == Type.TOPRATE){
                    var movieData = _moviePopularController.moviesTopRate.results![index];
                    Get.to(DetailMovie(type: Type.TOPRATE,), arguments: movieData.id,);
                  }
                  else if(title == Type.UPCOMING){
                    var movieData = _moviePopularController.moviesUpcoming.results![index];
                    Get.to(DetailMovie(type: Type.UPCOMING,), arguments: movieData.id,);
                  }
                },
                child: MovieListTile(
                  type: title,
                  index: index,
                ),
              ),
              itemCount:
              _moviePopularController.moviesPopular.results!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: width(5),
                mainAxisSpacing: height(20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

