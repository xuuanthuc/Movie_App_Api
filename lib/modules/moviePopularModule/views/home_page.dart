import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app/modules/moviePopularModule/controllers/movie_upcoming_controller.dart';
import 'package:movie_app/modules/moviePopularModule/views/widget/showall_upcoming.dart';
import '/modules/moviePopularModule/controllers/movie_popular_controller.dart';
import '/modules/moviePopularModule/controllers/movie_top_rate_controller.dart';
import '/modules/moviePopularModule/views/widget/deltail_movie_popular.dart';
import '/modules/moviePopularModule/views/widget/deltail_movie_top_rate.dart';
import '/modules/moviePopularModule/views/widget/movie_toprate_list_tile.dart';
import '/modules/moviePopularModule/views/widget/showall_popular.dart';
import '/modules/moviePopularModule/views/widget/showall_toprate.dart';
import '/util/common/screen_util.dart';
import 'widget/deltail_movie_upcoming.dart';
import 'widget/movie_list_tile.dart';
import 'widget/movie_upcoming_list_tile.dart';

class MovieHomePage extends StatelessWidget {
  final MoviePopularController _moviePopularController = Get.find();
  final MovieTopRateController _movieTopRateController = Get.find();
  final MovieUpcomingController _movieUpcomingController = Get.find();

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
                  onTap: () => Get.to(ShowAllUpcoming()),
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
            child: GetBuilder<MovieUpcomingController>(
              init: _movieUpcomingController,
              builder: (context) => _movieUpcomingController.isLoading
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
                            _movieUpcomingController.movies.results![index];
                            Get.to(
                              DetailMovieUpcoming(),
                              arguments: movieData.id,
                            );
                            print(movieData.title);
                          },
                          child: MovieUpcomingListTile(
                            index: index,
                          ),
                        ),
                        itemCount:
                        _movieUpcomingController.movies.results!.length,
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
                  onTap: () => Get.to(ShowAllTopRate()),
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
            child: GetBuilder<MovieTopRateController>(
              init: _movieTopRateController,
              builder: (context) => _movieTopRateController.isLoading
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
                                _movieTopRateController.movies.results![index];
                            Get.to(
                              DetailMovieTopRate(),
                              arguments: movieData.id,
                            );
                            print(movieData.title);
                          },
                          child: MovieTopRateListTile(
                            index: index,
                          ),
                        ),
                        itemCount:
                            _movieTopRateController.movies.results!.length,
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
                  onTap: () => Get.to(ShowAllPopular()),
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
            child: GetBuilder<MoviePopularController>(
              init: _moviePopularController,
              builder: (context) => _moviePopularController.isLoading
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
                                _moviePopularController.movies.results![index];
                            Get.to(
                              DetailMoviePopular(),
                              arguments: movieData.id,
                            );
                            print(movieData.title);
                          },
                          child: MovieListTile(
                            index: index,
                          ),
                        ),
                        itemCount:
                            _moviePopularController.movies.results!.length,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
