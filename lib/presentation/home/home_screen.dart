import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_base/domain/modal/user_model.dart';
import 'package:flutter_getx_base/presentation/home/home_controller.dart';
import 'package:flutter_getx_base/resources/size/pixel_ratio.dart';
import 'package:flutter_getx_base/resources/strings/strings_manager.dart';
import 'package:flutter_getx_base/resources/styles/styles_manager.dart';
import 'package:flutter_getx_base/resources/widgets/process_widget.dart';
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
      body: Processing<List<UserModel>>(
          processState: controller.userListState,
          builder: (data) {
            return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: ClipOval(
                    child: Image.network(
                      data[index].pictureModel.medium,
                      width: fixed(PixelRatio.dp50),
                      height: fixed(PixelRatio.dp50),
                    ),
                  ),
                  title: Text(data[index].name.first),
                  subtitle: Text(data[index].email),
                );
              },
              itemCount: data.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            );
          }),
    );
  }
}
