import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class LoginRequest {
  LoginRequest(this.grantTpe, this.username, this.password);

  @JsonProperty(name: 'grant_type')
  String grantTpe;
  @JsonProperty(name: 'username')
  String username;
  @JsonProperty(name: 'password')
  String password;
}
