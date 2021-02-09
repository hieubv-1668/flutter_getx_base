import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter_getx_base/data/remote/api/user_api_provider.dart';
import 'package:get/get.dart';
import 'package:flutter_getx_base/data/remote/api/response/response_define.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() {
      Get.put(UserApiProvider());
      return HomeController(apiProvider: Get.find());
    });
  }
}

class HomeController extends GetxController {
  HomeController({this.apiProvider});
  UserApiProvider apiProvider;

  @override
  void onInit() async {
    super.onInit();
    Response response = await apiProvider.getUser();
    UserResponse user = JsonMapper.deserialize(response.bodyString);
    print(user.data);
  }
}
