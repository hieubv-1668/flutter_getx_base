import 'package:get/get_connect/connect.dart';

class UserApiProvider extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = "https://randomuser.me";
    httpClient.addRequestModifier((request) {
      request.headers['apikey'] = '12345678';
      return request;
    });
    httpClient.addAuthenticator((request) async {
      final response = await get("http://yourapi/token");
      final token = response.body['token'];
      // Set the header
      request.headers['Authorization'] = "$token";
      return request;
    });
  }

  Future<Response> getUser() => get('/api/?results=10');
}
