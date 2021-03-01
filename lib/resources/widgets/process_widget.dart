import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_base/domain/base/process_state.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

typedef WidgetCallback<T> = Widget Function(T);

class Processing<T> extends StatelessWidget {
  Processing({
    @required this.processState,
    @required this.builder,
  });

  final RxProcessState<T> processState;
  final WidgetCallback<T> builder;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (processState.status()) {
        case ProcessStatus.FIRST_LOAD:
          return Center(
            child: CircularProgressIndicator(),
          );
        case ProcessStatus.ERROR:
          return Container();
        case ProcessStatus.SUCCESS:
          return builder(processState.data);
      }
      return Container();
    });
  }
}
