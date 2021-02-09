import 'package:flutter/material.dart';
import 'package:flutter_getx_base/presentation/flutter_base_app.dart';
import 'package:flutter_getx_base/utils/config/app_config.dart';

import 'main_stg.mapper.g.dart' show initializeJsonMapper;

void main() {
  initializeJsonMapper();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(
      appConfig: AppConfig.fromSTG(),
    ),
  );
}
