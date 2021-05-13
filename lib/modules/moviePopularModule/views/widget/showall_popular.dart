import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/modules/moviePopularModule/controllers/movie_popular_controller.dart';
import '/util/common/screen_util.dart';

import 'deltail_movie_popular.dart';
import 'movie_list_tile.dart';
class ShowAllPopular extends StatelessWidget {
  MoviePopularController _moviePopularController = Get.find();
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text('Popular', style: TextStyle(color: Colors.redAccent),),
        ),
        body: Container(
          padding: EdgeInsets.only(left: width(20)),
          color: Colors.white,
          child: GetBuilder<MoviePopularController>(
            init: _moviePopularController,
            builder: (context) => _moviePopularController.isLoading
                ? CircularProgressIndicator()
                : Container(
              child: GridView.builder(
                itemBuilder: (_, index) => GestureDetector(
                  onTap:(){
                    var movieData = _moviePopularController.movies.results![index];
                    Get.to(DetailMoviePopular(), arguments: movieData.id,
                    );
                    print(movieData.title);
                  },
                  child: MovieListTile(
                    index: index,
                  ),
                ),
                itemCount:
                _moviePopularController.movies.results!.length,
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

