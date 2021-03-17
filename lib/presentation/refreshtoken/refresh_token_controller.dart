import 'package:flutter_getx_base/data/remote/api/error/network_exception.dart';
import 'package:flutter_getx_base/domain/base/process_state.dart';
import 'package:flutter_getx_base/domain/modal/bengkei_user_model.dart';
import 'package:flutter_getx_base/domain/usecases/base/base_observer.dart';
import 'package:flutter_getx_base/domain/usecases/get_user_beng_use_case.dart';
import 'package:flutter_getx_base/presentation/base_controller.dart';
import 'package:get/get.dart';

class RefreshTokenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetBengKeiUserUseCase(Get.find()));
    Get.lazyPut(() => RefreshTokenController(Get.find()));
  }
}

class RefreshTokenController extends BaseController {
  RefreshTokenController(this._getBengKeiUserUseCase);

  final GetBengKeiUserUseCase _getBengKeiUserUseCase;
  final ProcessState<List<BengKeiUserModel>> bengKeiUserListState =
      ProcessState();

  @override
  void onInit() {
    super.onInit();
    _getBengKeiUserUseCase.execute(
      observer: Observer(
        onSubscribe: () {
          bengKeiUserListState.onLoading();
        },
        onSuccess: (data) {
          bengKeiUserListState.onSuccess(data: data);
        },
        onError: (NetWorkException exception) {
          bengKeiUserListState.onError(exception.getMessage());
        },
      ),
    );
  }

  void getUserList() {}
}
