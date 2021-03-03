import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_base/presentation/home/home_controller.dart';
import 'package:flutter_getx_base/resources/size/pixel_ratio.dart';
import 'package:flutter_getx_base/resources/strings/strings_manager.dart';
import 'package:flutter_getx_base/resources/styles/styles_manager.dart';
import 'package:flutter_getx_base/resources/widgets/infinite_scroll.dart';
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
      body: controller.userListState.obx(
        (state) => InfiniteScrollList(builder: (controller) {
          return ListView.separated(
            controller: controller,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Column(
                          children: <Widget>[
                            Image.network(
                              state[index].pictureModel.large,
                              width: fixed(PixelRatio.dp375),
                              height: fixed(PixelRatio.dp375),
                              fit: BoxFit.cover,
                            )
                          ],
                        );
                      });
                },
                leading: ClipOval(
                  child: Image.network(
                    state[index].pictureModel.medium,
                    width: fixed(PixelRatio.dp50),
                    height: fixed(PixelRatio.dp50),
                  ),
                ),
                title: Text(state[index].name.first),
                subtitle: Text(state[index].email),
              );
            },
            itemCount: state.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
          );
        }),
      ),
    );
  }
}
