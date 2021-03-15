import 'dart:async';
import 'dart:convert';

import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter_getx_base/data/remote/api/base_provider.dart';
import 'package:flutter_getx_base/data/remote/api/request/login_request.dart';
import 'package:flutter_getx_base/data/remote/api/request/refresh_token_request.dart';
import 'package:flutter_getx_base/data/remote/api/request/register_request.dart';
import 'package:flutter_getx_base/data/user_repository_implement.dart';
import 'package:flutter_getx_base/domain/modal/token_model.dart';
import 'package:get/get.dart';

class BengKeiApiProvider extends BaseProvider {
  @override
  void onInit() {
    httpClient.baseUrl = "http://bengkelrobot.net:8002";
    httpClient.timeout = Duration(seconds: 15);
    httpClient.errorSafety = false;
    httpClient.maxAuthRetries = 3;

    httpClient.addAuthenticator((request) async {
      var newToken = await Get.find<UserRepositoryImpl>().refreshToken();
      request.headers['Authorization'] = 'Bearer ${newToken.accessToken}';
      return request;
    });

    httpClient.addRequestModifier((request) async {
      var userToken = Get.find<UserRepositoryImpl>().getToken();
      if (userToken != null) {
        request.headers['Authorization'] = 'Bearer ${userToken.accessToken}';
      } else {
        request.headers['Authorization'] = 'Basic ' +
            base64Encode(
                utf8.encode('bengkel-robot-client:bengkel-robot-secret'));
      }
      return request;
    });
  }

  Future<void> registerUser(RegisterRequest request) {
    return postDeserialize(
      '/register/user',
      JsonMapper.toJson(request),
    );
  }

  Future<TokenModel> login(LoginRequest request) {
    return postDeserialize<TokenModel>(
      '/oauth/token',
      FormData(
        JsonMapper.toMap(request),
      ),
    );
  }

  Future<TokenModel> refreshToken(RefreshTokenRequest request) {
    return postDeserialize<TokenModel>(
      '/oauth/token',
      FormData(
        JsonMapper.toMap(request),
      ),
    );
  }

  Future<TokenModel> getListUser() {
    return getDeserialize(
      '/users/user',
    );
  }
}
