import 'package:flutter_getx_base/domain/base/process_state.dart';
import 'package:flutter_getx_base/domain/modal/user_model.dart';
import 'package:flutter_getx_base/domain/usecases/base/base_observer.dart';
import 'package:flutter_getx_base/domain/usecases/get_user_use_case.dart';
import 'package:flutter_getx_base/presentation/base_controller.dart';
import 'package:flutter_getx_base/utils/cores/dialog.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() {
      Get.put(GetUserUseCase(Get.find()));
      return HomeController();
    });
  }
}

class HomeController extends BaseController {
  final GetUserUseCase _getUserUseCase = Get.find();

  final ProcessState<List<UserModel>> userListState = ProcessState();

  @override
  void onInit() {
    super.onInit();
    userListState.addListener(() async {
      if (userListState.status.isError) {
        bool result =
            await showConfirmDialog(userListState.status.errorMessage);
        print(result);
      }
    });
    getUserList();
  }

  Future<void> getUserList() async {
    print(userListState.nextPage);
    await _getUserUseCase.execute(
      observer: Observer(
        onSubscribe: () {
          userListState.onLoading();
        },
        onSuccess: (data) {
          userListState.onSuccess(data.first(), nextPage: data.second());
        },
        onError: (Exception e) {
          userListState.onError(e.toString());
        },
      ),
      input: GetUserUseCaseInput(userListState.nextPage),
    );
  }

  @override
  void dispose() {
    _getUserUseCase.dispose();
    userListState.dispose();
    super.dispose();
  }
}
