import 'package:flutter_getx_base/data/remote/api/random_user_api_provider.dart';
import 'package:flutter_getx_base/data/user_repository_implement.dart';
import 'package:flutter_getx_base/resources/colors/colors_manager.dart';
import 'package:flutter_getx_base/resources/styles/styles_manager.dart';
import 'package:get/get.dart';

import 'app_config.dart';

class AppBinding extends Bindings {
  AppBinding({this.appConfig});

  AppConfig appConfig;

  @override
  void dependencies() {
    injectAppConfig();
    injectColorsManager();
    injectStylesManager();
    injectApiProvider();
    injectRepository();
  }

  void injectAppConfig() {
    Get.put(ColorsManager());
  }

  void injectColorsManager() {
    Get.put(appConfig);
  }

  void injectStylesManager() {
    Get.put(StylesManager());
  }

  void injectApiProvider() {
    Get.put(RandomUserApiProvider());
  }

  void injectRepository() {
    Get.lazyPut<UserRepositoryImpl>(() => UserRepositoryImpl());
  }
}
