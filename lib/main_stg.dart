import 'package:flutter/material.dart';
import 'package:flutter_getx_base/presentation/flutter_base_app.dart';
import 'package:flutter_getx_base/utils/config/app_config.dart';
import 'package:get_storage/get_storage.dart';

import 'main_stg.mapper.g.dart' show initializeJsonMapper;

void main() async {
  initializeJsonMapper();
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(
      appConfig: AppConfig.fromSTG(),
    ),
  );
}
