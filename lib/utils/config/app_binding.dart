import 'package:flutter_getx_base/resources/colors/colors_manager.dart';
import 'package:flutter_getx_base/resources/styles/styles_manager.dart';
import 'package:get/get.dart';

import 'app_config.dart';

class AppBinding extends Bindings {
  AppBinding({this.appConfig});

  AppConfig appConfig;

  @override
  void dependencies() {
    injectColorsManager();
    injectStylesManager();
  }

  void injectColorsManager() {
    Get.put(ColorsManager());
  }

  void injectStylesManager() {
    Get.put(StylesManager());
  }
}
