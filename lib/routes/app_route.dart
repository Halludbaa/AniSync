import 'package:anisync_flutter/pages/auth/login.dart';
import 'package:anisync_flutter/pages/auth/register.dart';
import 'package:anisync_flutter/pages/home/home.dart';
import 'package:anisync_flutter/routes/app_route_named.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppRoute {
  static final routes = [
    GetPage(name: AppRouteNamed.home, page: () => Home()),
    GetPage(name: AppRouteNamed.login, page: () => Login()),
    GetPage(name: AppRouteNamed.register, page: () => Register()),
  ];
}
