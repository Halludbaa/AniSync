import 'package:anisync_flutter/pages/auth/login.dart';
import 'package:anisync_flutter/pages/auth/register.dart';
import 'package:anisync_flutter/pages/details/anime_detail.dart';
import 'package:anisync_flutter/pages/home/home.dart';
import 'package:anisync_flutter/pages/splash/splash_screen.dart';
import 'package:anisync_flutter/pages/start/get_started.dart';
import 'package:anisync_flutter/pages/user/profile/user_profile.dart';
import 'package:anisync_flutter/routes/app_route_named.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppRoute {
  static final routes = [
    GetPage(name: AppRouteNamed.splash, page: () => SplashScreen()),
    GetPage(name: AppRouteNamed.home, page: () => Home()),
    GetPage(
      name: AppRouteNamed.getStarted,
      page: () => GetStarted(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 900),
    ),
    GetPage(name: AppRouteNamed.animeDetail, page: () => AnimeDetail()),
    GetPage(name: AppRouteNamed.login, page: () => Login()),
    GetPage(name: AppRouteNamed.register, page: () => Register()),
    GetPage(name: AppRouteNamed.profile, page: () => UserProfile()),
  ];
}
