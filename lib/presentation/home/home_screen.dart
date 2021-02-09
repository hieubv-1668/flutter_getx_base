import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_base/presentation/home/home_controller.dart';
import 'package:flutter_getx_base/resources/colors/colors_manager.dart';
import 'package:flutter_getx_base/resources/size/pixel_ratio.dart';
import 'package:flutter_getx_base/resources/strings/strings_manager.dart';
import 'package:flutter_getx_base/resources/styles/styles_manager.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeScreen extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.hello(),
          style: StylesManager.instance().roboto16Regular(),
        ),
      ),
      body: Container(
        color: ColorsManager.instance().colorRed(),
        height: fixed(PixelRatio.dp375),
        width: fixed(PixelRatio.dp375),
      ),
    );
  }
}
