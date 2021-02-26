import 'package:flutter_getx_base/data/local/user_local_data_source.dart';
import 'package:flutter_getx_base/data/remote/user_remote_data_source.dart';
import 'package:flutter_getx_base/domain/modal/user_model.dart';
import 'package:flutter_getx_base/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource _remoteDataSource = UserRemoteDataSource();
  final UserLocalDataSource _localDataSource = UserLocalDataSource();

  @override
  Future<List<UserModel>> getUsers() {
    return _remoteDataSource.getUsers();
  }
}
