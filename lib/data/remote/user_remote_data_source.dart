import 'package:flutter_getx_base/data/remote/api/random_user_api_provider.dart';
import 'package:flutter_getx_base/domain/modal/user_model.dart';
import 'package:flutter_getx_base/utils/cores/pair.dart';
import 'package:get/get.dart';

class UserRemoteDataSource {
  final RandomUserApiProvider _apiProvider = Get.find();

  Future<Pair<List<UserModel>, int>> getUsers(int page) {
    return _apiProvider.getUser(page);
  }
}
