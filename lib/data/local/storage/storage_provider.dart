import 'package:get_storage/get_storage.dart';

class StorageProvider {
  final GetStorage _getStorage = GetStorage();

  String getUsername() => _getStorage.read(StorageKey.keyUser);

  Future<void> saveUsername(String username) =>
      _getStorage.write(StorageKey.keyUser, username);
}

class StorageKey {
  static final String keyUser = 'user_information';
  static final String keyToken = 'user_token';
}
