import 'package:get/get.dart';
import 'package:helpme/route/route_constant.dart';

import '../module/home/home_screen.dart';
import '../module/search/search_screen.dart';

class AppRoute {
  static final all = [
    GetPage(name: RouteConstant.home, page: () => HomeScreen()),
    GetPage(name: RouteConstant.search, page: () => SearchScreen()),
  ];
}
