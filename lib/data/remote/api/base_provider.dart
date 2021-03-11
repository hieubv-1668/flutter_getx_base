import 'dart:ffi';

import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter_getx_base/data/remote/api/error/network_exception.dart';
import 'package:get/get.dart';

class BaseProvider extends GetConnect {
  Future<T> getDeserialize<T>(String url,
      {Map<String, String> headers,
      String contentType,
      Map<String, dynamic> query,
      decoder}) {
    final response = Response(
        statusCode: 401,
        bodyString: '{"status":{"message":"Lỗi rồi nè!", "status": 401}}');
    return super
        .get(url,
            headers: headers,
            contentType: contentType,
            query: query,
            decoder: decoder)
        .then(
          (value) => _mapTpoResponse<T>(value),
          onError: (e) => throw NetWorkException.fromException(e),
        );
  }

  Future<T> putDeserialize<T>(
    String url,
    dynamic body, {
    String contentType,
    Map<String, String> headers,
    Map<String, dynamic> query,
    Decoder<T> decoder,
    Progress uploadProgress,
  }) {
    return super
        .put(
          url,
          body,
          headers: headers,
          contentType: contentType,
          query: query,
          decoder: decoder,
          uploadProgress: uploadProgress,
        )
        .then(
          (value) => _mapTpoResponse<T>(value),
          onError: (e) => throw NetWorkException.fromException(e),
        );
  }

  Future<T> postDeserialize<T>(
    String url,
    dynamic body, {
    String contentType,
    Map<String, String> headers,
    Map<String, dynamic> query,
    Decoder<T> decoder,
    Progress uploadProgress,
  }) {
    return super
        .post(
          url,
          body,
          headers: headers,
          contentType: contentType,
          query: query,
          decoder: decoder,
          uploadProgress: uploadProgress,
        )
        .then(
          (value) => _mapTpoResponse<T>(value),
          onError: (e) => throw NetWorkException.fromException(e),
        );
  }

  Future<T> _mapTpoResponse<T>(Response response) async {
    if (response.status.isOk) {
      return T != dynamic ? JsonMapper.deserialize<T>(response.bodyString) : T;
    } else
      throw NetWorkException.fromResponse(response);
  }
}
