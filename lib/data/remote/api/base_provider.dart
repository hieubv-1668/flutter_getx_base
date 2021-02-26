import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:get/get.dart';

class BaseProvider extends GetConnect {
  Future<T> getDeserialize<T>(String url,
      {Map<String, String> headers,
      String contentType,
      Map<String, dynamic> query,
      decoder}) {
    return super
        .get(url,
            headers: headers,
            contentType: contentType,
            query: query,
            decoder: decoder)
        .then((value) => JsonMapper.deserialize<T>(value.bodyString));
  }
}
