import 'package:flutter_getx_base/data/remote/api/random_user_api_provider.dart';
import 'package:flutter_getx_base/domain/modal/user_model.dart';
import 'package:get/get.dart';

class UserRemoteDataSource {
  final RandomUserApiProvider _apiProvider = Get.find();

  Future<List<UserModel>> getUsers() {
    return _apiProvider.getUser();
  }
}
