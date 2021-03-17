import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseScaffold<T extends GetxController> extends GetWidget<T> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          title(),
        ),
      ),
      body: buildChild(context),
    );
  }

  Widget buildChild(BuildContext context);

  String title() => '';
}
