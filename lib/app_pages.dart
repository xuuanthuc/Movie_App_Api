import 'package:get/get.dart';
import '/models/common/error_model.dart';
import '/modules/common/error_page.dart';
import '/modules/moviePopularModule/bindings/movie_binding.dart';
import '/modules/moviePopularModule/views/home_page.dart';

abstract class Routes {
  static const SPLASH = '/splash';
  static const HOME = '/homeWeather';
  static const CITY_SEARCH = '/citySearch';
  static const SETTING = '/setting';
  static const ERROR = '/error';
  static const MOVIE_POPULAR = '/movie_popular_page';
}

class AppPages {
  static const INITIAL = Routes.MOVIE_POPULAR;
  static final unknownRoute =
      GetPage(name: Routes.ERROR, page: () => ErrorPage(error: ErrorModel()));
  static final routes = [
    GetPage(
      name: Routes.MOVIE_POPULAR,
      page: () => MovieHomePage(),
      bindings: [MovieBinding()],
    ),

  ];
}

// can add route children by that
// GetPage(
//   name: Routes.HOME,
//   page: () => HomeWeatherPage(),
//   binding: WeatherBinding(),
//   children: [
//     GetPage(
//     name: Routes.CITY_SEARCH,
//     page: () => CitySearchPage(),
//     ),
//     GetPage(
//     name: Routes.SETTING,
//     page: () => SettingLangPage(),
//     ),
//   ]
// ),
