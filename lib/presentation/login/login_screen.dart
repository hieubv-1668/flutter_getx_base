import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_base/presentation/login/login_controller.dart';
import 'package:flutter_getx_base/resources/size/pixel_ratio.dart';
import 'package:flutter_getx_base/resources/widgets/base_widget.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginScreen extends BaseScaffold<LoginController> {
  @override
  String title() {
    return 'Login';
  }

  @override
  Widget buildChild(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: fixed(PixelRatio.dp20)),
      child: Stack(
        children: [
          controller.loginState.obx(
            (state) => Container(),
          ),
          _loginForm(),
        ],
      ),
    );
  }

  Widget _loginForm() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'username',
          ),
          controller: controller.usernameTextEditingController,
        ),
        SizedBox(
          height: fixed(PixelRatio.dp20),
        ),
        TextField(
          controller: controller.passwordTextEditingController,
          decoration: InputDecoration(hintText: 'password'),
        ),
        SizedBox(
          height: fixed(PixelRatio.dp20),
        ),
        ElevatedButton(
          onPressed: () => controller.onLogin(),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: PixelRatio.dp20),
            width: double.infinity,
            child: Center(
              child: Text('Login'),
            ),
          ),
        ),
        SizedBox(
          height: fixed(PixelRatio.dp20),
        ),
        TextButton(
          onPressed: () {},
          child: Text('or register now'),
        )
      ],
    );
  }
}
