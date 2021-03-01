import 'package:flutter_getx_base/domain/base/process_state.dart';
import 'package:flutter_getx_base/domain/modal/user_model.dart';
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

  final RxProcessState<List<UserModel>> userListState =
      RxProcessState<List<UserModel>>.init();

  var name = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    _getUserList();
  }

  void _getUserList() {
    _getUserUseCase.execute(
      observer: Observer(
        onSubscribe: () {
          userListState.setFirstLoading();
        },
        onSuccess: (data) {
          userListState.setSuccess(data);
        },
        onError: (Exception e) {
          userListState.setError(e.toString());
        },
      ),
    );
  }

  @override
  void dispose() {
    _getUserUseCase.dispose();
    super.dispose();
  }
}
