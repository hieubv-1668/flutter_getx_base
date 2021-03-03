import 'package:flutter_getx_base/domain/modal/user_model.dart';
import 'package:flutter_getx_base/utils/cores/pair.dart';

abstract class UserRepository {
  Future<Pair<List<UserModel>, int>> getUsers(int page);

  Future<void> saveUsername(String username);
}
