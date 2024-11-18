import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:zaylo/Routes/route_name.dart';
import 'package:zaylo/Views/auths/login_screen.dart';

import 'package:zaylo/Views/splash/splash.dart';

class RouteDestinations{
  static List<GetPage> pages = [
    GetPage(
      name: RouteNames.splash,
      page: ()=> const SplashScreen(),
    ),
    GetPage(
      name: RouteNames.login,
      page: ()=> const LoginScreen(),
    ),

  ];

}