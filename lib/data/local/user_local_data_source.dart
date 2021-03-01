import 'package:flutter_getx_base/data/local/storage/storage_provider.dart';
import 'package:get/get.dart';

class UserLocalDataSource {
  final StorageProvider _storageProvider = Get.find();

  String getUsername() => _storageProvider.getUsername();

  Future<void> saveUsername(String username) =>
      _storageProvider.saveUsername(username);
}
