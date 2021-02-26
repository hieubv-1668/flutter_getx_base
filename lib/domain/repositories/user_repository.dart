import 'package:flutter_getx_base/domain/modal/user_model.dart';

abstract class UserRepository {
  Future<List<UserModel>> getUsers();
}
