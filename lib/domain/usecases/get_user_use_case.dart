import 'dart:async';

import 'package:flutter_getx_base/data/user_repository_implement.dart';
import 'package:flutter_getx_base/domain/modal/user_model.dart';
import 'package:flutter_getx_base/domain/usecases/base/base_use_case.dart';
import 'package:get/get.dart';

class GetUserUseCase extends UseCase<List<UserModel>, GetUserUseCaseInput> {
  final UserRepositoryImpl _userRepositoryImpl = Get.find();

  @override
  Future<List<UserModel>> buildUseCase(GetUserUseCaseInput input) {
    return _userRepositoryImpl.getUsers();
  }
}

class GetUserUseCaseInput {}
