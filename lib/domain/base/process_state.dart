import 'package:get/get.dart';

int inititalPage = 1;

class ProcessState<T> extends GetxController with StateMixin<T> {
  void onSuccess(T data, {int nextPage}) {
    change(data, status: RxStatus.success());
  }

  void onError(String message) {
    change(null, status: RxStatus.error(message));
  }

  void onLoading() {
    change(null, status: RxStatus.loading());
  }
}
