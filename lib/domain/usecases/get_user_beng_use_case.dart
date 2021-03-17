import 'dart:async';

import 'package:flutter_getx_base/data/user_repository_implement.dart';
import 'package:flutter_getx_base/domain/modal/bengkei_user_model.dart';
import 'package:flutter_getx_base/domain/usecases/base/base_use_case.dart';

class GetBengKeiUserUseCase extends UseCase<List<BengKeiUserModel>, void> {
  GetBengKeiUserUseCase(this.userRepositoryImpl);

  final UserRepositoryImpl userRepositoryImpl;

  @override
  Future<List<BengKeiUserModel>> buildUseCase(_) {
    return userRepositoryImpl.getBengUserList();
  }
}
