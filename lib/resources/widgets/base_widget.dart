import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseScaffold<T extends GetxController> extends GetWidget<T> {
  final String tilte = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(tilte),
      ),
      body: buildChild(context),
    );
  }

  Widget buildChild(BuildContext context) => Container();
}
