import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter_getx_base/domain/modal/user_model.dart';

@jsonSerializable
class BaseResponse<T> {
  static Map<Type, ValueDecoratorFunction> valueDecorators() => {
        typeOf<List<UserModel>>(): (value) => value.cast<UserModel>(),
      };

  @JsonProperty(name: 'message')
  String messgae;

  @JsonProperty(name: 'results')
  T data;
}

@jsonSerializable
class UserResponse extends BaseResponse {}
