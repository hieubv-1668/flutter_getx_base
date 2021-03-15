import 'package:flutter/cupertino.dart';
import 'package:flutter_getx_base/data/local/storage/storage_provider.dart';
import 'package:flutter_getx_base/presentation/home/home_controller.dart';
import 'package:flutter_getx_base/presentation/home/home_screen.dart';
import 'package:flutter_getx_base/presentation/login/login_controller.dart';
import 'package:flutter_getx_base/presentation/login/login_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  static String routeHomeScreen() => '/';
  static String routeLoginScreen() => '/login';
  static String routeRegisterScreen() => '/register';
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
        GetPage(
          name: routeLoginScreen(),
          page: () => LoginScreen(),
          binding: LoginBinding(),
        )
      ];
}

class AuthenMiddleware extends GetMiddleware {
  @override
  RouteSettings redirect(String route, {Object arguments}) {
    var isLogged = Get.find<StorageProvider>().getToken() != null;
    return isLogged
        ? null
        : RouteSettings(
            name: AppRoute.routeLoginScreen(), arguments: arguments);
  }
}
