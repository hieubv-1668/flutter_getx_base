import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef WidgetCallback = ScrollView Function(ScrollController);

typedef FutureCallback = Future<void> Function();

double visibleThreshold = 200;

class InfiniteScrollList extends StatefulWidget {
  const InfiniteScrollList({
    this.onLoadMore,
    this.onRefresh,
    @required this.builder,
  });
  final FutureCallback onRefresh;
  final FutureCallback onLoadMore;
  final WidgetCallback builder;

  @override
  _InfiniteScrollListState createState() => _InfiniteScrollListState();
}

class _InfiniteScrollListState extends State<InfiniteScrollList> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (!_isLoading && widget.onLoadMore != null) {
      _scrollController.addListener(() async {
        if (_scrollController.position.extentAfter < visibleThreshold &&
            !_isLoading) {
          _isLoading = true;
          await widget.onLoadMore.call();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _isLoading = false;
    });
    return widget.onRefresh == null
        ? widget.builder(_scrollController)
        : RefreshIndicator(
            child: widget.builder(_scrollController),
            onRefresh: widget.onRefresh,
          );
  }
}
