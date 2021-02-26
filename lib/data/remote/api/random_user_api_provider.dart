import 'package:flutter_getx_base/data/remote/api/base_provider.dart';
import 'package:flutter_getx_base/data/remote/api/response/base_response.dart';
import 'package:flutter_getx_base/domain/modal/user_model.dart';

class RandomUserApiProvider extends BaseProvider {
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

  Future<List<UserModel>> getUser() async {
    return getDeserialize<BaseResponse<List<UserModel>>>('/api/?results=10')
        .then((value) => value.data);
  }
}
