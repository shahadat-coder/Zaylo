import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:zaylo/Routes/route_name.dart';
import 'package:zaylo/Views/auths/login_screen.dart';
import 'package:zaylo/Views/auths/register_screens.dart';
import 'package:zaylo/Views/button_sheet/buttonsheet.dart';

import 'package:zaylo/Views/splash/splash.dart';
import 'package:zaylo/Views/welcome/welcome_screen.dart';

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
    GetPage(
      name: RouteNames.register,
      page: ()=> const RegisterScreen(),
    ),
    GetPage(
      name: RouteNames.welcome,
      page: ()=> const WelcomeScreen(),
    ),
    GetPage(
      name: RouteNames.buttonsheet,
      page: ()=> const ButtonsheetWidget(),
    ),
  ];

}