import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseScaffold<T extends GetxController> extends GetWidget<T> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: buildChild(context),
    );
  }

  Widget buildChild(BuildContext context) => Container();
}
