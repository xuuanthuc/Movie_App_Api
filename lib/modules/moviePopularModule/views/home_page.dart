import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/util/theme/type_movie.dart';
import '/modules/moviePopularModule/controllers/movie_controller.dart';
import '/modules/moviePopularModule/views/widget/deltail_movie_popular.dart';
import '/modules/moviePopularModule/views/widget/showall.dart';
import '/util/common/screen_util.dart';
import 'widget/movie_list_tile.dart';

class MovieHomePage extends StatelessWidget {
  final MovieController _movieController = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'The movies'.toUpperCase(),
          style: TextStyle(
            color: Colors.redAccent,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            PopularMovie(),
            SizedBox(height: height(15),),
            TopRateMovie(),
            SizedBox(height: height(15),),
            UpcomingMovie(),
          ],
        ),
      ),
    );
  }

  Container UpcomingMovie() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                    text: 'Upcoming',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.black87,
                        fontSize: size(18)),
                    children: [
                      TextSpan(
                          text: ' Movies',
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w400)),
                    ]),
              ),
              GestureDetector(
                  onTap: () => Get.to(ShowAll(title: Type.UPCOMING, )),
                  child: Text(
                    'Show All',
                    style: TextStyle(
                        fontSize: size(16),
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.w500),
                  )),
            ],
          ),
          SizedBox(
            height: height(10),
          ),
          Container(
            height: height(200),
            child: GetBuilder<MovieController>(
              init: _movieController,
              builder: (context) => _movieController.isLoading
                  ? LinearProgressIndicator(
                      backgroundColor: Colors.red[200],
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.redAccent),
                    )
                  : Container(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) => GestureDetector(
                          onTap: () {
                            var movieData =
                            _movieController.moviesUpcoming.results![index];
                            Get.to(
                              DetailMovie(type: Type.UPCOMING,),
                              arguments: movieData.id,
                            );
                            print(movieData.title);
                          },
                          child: MovieListTile(
                            type: Type.UPCOMING,
                            index: index,
                          ),
                        ),
                        itemCount:
                        _movieController.moviesUpcoming.results!.length,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
  Container TopRateMovie() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                    text: 'Top Rate',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.black87,
                        fontSize: size(18)),
                    children: [
                      TextSpan(
                          text: ' Movies',
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w400)),
                    ]),
              ),
              GestureDetector(
                  onTap: () => Get.to(ShowAll(title: Type.TOPRATE)),
                  child: Text(
                    'Show All',
                    style: TextStyle(
                        fontSize: size(16),
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.w500),
                  )),
            ],
          ),
          SizedBox(
            height: height(10),
          ),
          Container(
            height: height(200),
            child: GetBuilder<MovieController>(
              init: _movieController,
              builder: (context) => _movieController.isLoading
                  ? LinearProgressIndicator(
                backgroundColor: Colors.red[200],
                valueColor:
                AlwaysStoppedAnimation<Color>(Colors.redAccent),
              )
                  : Container(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: () {
                      var movieData =
                      _movieController.moviesTopRate.results![index];
                      Get.to(
                        DetailMovie(type: Type.TOPRATE,),
                        arguments: movieData.id,
                      );
                      print(movieData.title);
                    },
                    child: MovieListTile(
                      type: Type.TOPRATE,
                      index: index,
                    ),
                  ),
                  itemCount:
                  _movieController.moviesTopRate.results!.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container PopularMovie() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                    text: 'Popular',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.black87,
                        fontSize: size(18)),
                    children: [
                      TextSpan(
                          text: ' Movies',
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w400)),
                    ]),
              ),
              GestureDetector(
                  onTap: () => Get.to(ShowAll(title: Type.POPULAR,)),
                  child: Text(
                    'Show All',
                    style: TextStyle(
                        fontSize: size(16),
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.w500),
                  )),
            ],
          ),
          SizedBox(
            height: height(10),
          ),
          Container(
            height: height(200),
            child: GetBuilder<MovieController>(
              init: _movieController,
              builder: (context) => _movieController.isLoading
                  ? LinearProgressIndicator(
                backgroundColor: Colors.red[200],
                valueColor:
                AlwaysStoppedAnimation<Color>(Colors.redAccent),
              )
                  : Container(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: () {
                      var movieData =
                      _movieController.moviesPopular.results![index];
                      Get.to(
                        DetailMovie(type: Type.POPULAR,),
                        arguments: movieData.id,
                      );
                      print(movieData.title);
                    },
                    child: MovieListTile(
                      type: 'Popular',
                      index: index,
                    ),
                  ),
                  itemCount:
                  _movieController.moviesPopular.results!.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
