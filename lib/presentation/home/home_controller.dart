import 'package:flutter_getx_base/domain/usecases/base/base_observer.dart';
import 'package:flutter_getx_base/domain/usecases/get_user_use_case.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() {
      Get.put(GetUserUseCase());
      return HomeController();
    });
  }
}

class HomeController extends GetxController {
  final GetUserUseCase _getUserUseCase = Get.find();

  @override
  void onInit() async {
    super.onInit();
    _getUserUseCase.execute(
      observer: Observer(
        onSubscribe: () {},
        onSuccess: (data) {
          print(data);
        },
        onCompleted: () {},
        onError: () {},
      ),
    );
  }

  @override
  void dispose() {
    _getUserUseCase.dispose();
    super.dispose();
  }
}
