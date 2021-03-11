import 'package:flutter/cupertino.dart';
import 'package:flutter_getx_base/presentation/home/home_controller.dart';
import 'package:flutter_getx_base/presentation/home/home_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  static String routeHomeScreen() => '/';
  static String routeSearchScreen() => '/search';

  static List<GetPage> generateGetPages() => [
        GetPage(
          name: routeHomeScreen(),
          page: () => HomeScreen(),
          binding: HomeBinding(),
          transition: Transition.cupertino,
          middlewares: [AuthenMiddleware()],
          children: [
            GetPage(
              transition: Transition.cupertino,
              name: routeSearchScreen(),
              page: () => Container(),
            ),
          ],
        ),
      ];
}

class AuthenMiddleware extends GetMiddleware {
  @override
  RouteSettings redirect(String route, {Object arguments}) {
    var isLogged = true;
    return isLogged
        ? null
        : RouteSettings(name: '/login', arguments: arguments);
  }
}
