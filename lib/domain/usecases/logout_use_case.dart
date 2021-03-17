import 'package:flutter_getx_base/data/user_repository_implement.dart';
import 'package:flutter_getx_base/domain/usecases/base/base_use_case.dart';

class LogoutUseCase extends UseCase<void, void> {
  LogoutUseCase(this.userRepositoryImpl);

  final UserRepositoryImpl userRepositoryImpl;

  @override
  Future<void> buildUseCase(_) async {
    return userRepositoryImpl.logout();
  }
}
