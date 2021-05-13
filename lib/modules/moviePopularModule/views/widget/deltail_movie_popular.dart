import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/data/url_api.dart';
import '/modules/moviePopularModule/controllers/movie_popular_controller.dart';
import '/modules/moviePopularModule/controllers/movie_top_rate_controller.dart';
import '/util/common/screen_util.dart';

class DetailMoviePopular extends StatelessWidget {
  MoviePopularController moviePopularController = Get.find();

  // var moviedId = Get.arguments[0];

  @override
  Widget build(BuildContext context) {
    var movieId = Get.arguments;
    var loadedMovie = moviePopularController.findById(movieId);
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: height(310),
              flexibleSpace: Container(
                color: Color(0xfff4f4f4),
                child: Stack(
                  children: [
                    Positioned.fill(
                      bottom: height((110)),
                      child: FlexibleSpaceBar(
                        background: Stack(
                          children: [
                            Container(
                              child: Image.network(
                                '${getImagePosterMovie}${loadedMovie.backdropPath}',
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            Container(
                              color: Color.fromRGBO(0, 0, 0, 0.3),
                            ),
                          ],
                        ),
                        centerTitle: true,
                        title: Padding(
                          padding: EdgeInsets.only(
                              bottom: height(80), left: width(40), right: width(40)),
                          child: Text(
                            loadedMovie.title.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(

                              fontSize: size(16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: height(10),
                      left: width(20),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(radius(10)),
                            border: Border.all(color: Colors.grey, width: width(1))),
                        height: height(200),
                        width: width(133),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(radius(10)),
                          child: Image.network(
                            '${getImagePosterMovie}${loadedMovie.posterPath}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: height(120),
                        left: width(170),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star_border,
                                  color: Colors.white70,
                                ),
                                SizedBox(
                                  width: width(4),
                                ),
                                Text(
                                  '${loadedMovie.voteAverage} (${loadedMovie.voteCount} Reviews)',
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: size(16)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height(8),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.turned_in_not,
                                  color: Colors.white70,
                                ),
                                SizedBox(
                                  width: width(4),
                                ),
                                Text(
                                  '${loadedMovie.releaseDate} Released',
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: size(16)),
                                ),
                              ],
                            ),
                          ],
                        )),
                    Positioned(
                        bottom: height(40),
                        left: width(170),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Icon(Icons.bookmarks_outlined, color: Colors.black54,),
                                Text('Watchlist',style: TextStyle(color: Colors.black54),),
                              ],
                            ),
                            SizedBox(width: width(30),),
                            Column(
                              children: [
                                Icon(Icons.favorite_outline,color: Colors.black54,),
                                Text('Favourite',style: TextStyle(color: Colors.black54),),
                              ],
                            ),
                            SizedBox(width: width(30),),
                            Column(
                              children: [
                                Icon(Icons.share_outlined,color: Colors.black54,),
                                Text('Share',style: TextStyle(color: Colors.black54),),
                              ],
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding:
                     EdgeInsets.symmetric(horizontal: width(20), vertical: height(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Overview',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                          fontSize: size(22)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      loadedMovie.overview,
                      style: TextStyle(color: Colors.black38, fontSize: size(18)),
                    )
                  ],
                ),
              );
            }, childCount: 9))
          ],
        ),
      ),
    );
  }
}
