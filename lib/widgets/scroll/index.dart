import 'dart:async';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter/material.dart';

/*
    下拉和上拉的组件
*/

// ignore: must_be_immutable
class ScrollWidget extends StatefulWidget {
  Widget child;
  final Function onRefresh;
  final Function onLoad;
  bool offLoad;
  bool offRefresh;
  ScrollController scrollController = new ScrollController();
  ScrollWidget(
      {Key key,
      this.child,
      this.onRefresh,
      this.onLoad,
      this.offLoad = false,
      this.offRefresh = false,
      this.scrollController})
      : super(key: key);

  @override
  _ScrollWidgettate createState() => _ScrollWidgettate();
}

class _ScrollWidgettate extends State<ScrollWidget> {
  EasyRefreshController _controller = EasyRefreshController();
  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    this._controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new EasyRefresh(
      scrollController: widget.scrollController ?? null,
      enableControlFinishRefresh: true,
      enableControlFinishLoad: true,
      header: MaterialHeader(),
      //   footer: ClassicalFooter(
      //     loadText: "加载中",
      //     loadingText: "加载中",
      //     loadedText: "加载完成",
      //     showInfo: false,
      //   ),
      footer: BallPulseFooter(),
      //   footer: BezierBounceFooter(
      //     color: Colors.blue,
      //     backgroundColor: Colors.transparent,
      //   ),
      // footer: MaterialFooter(),
      controller: this._controller,
      onRefresh: widget.offRefresh
          ? null
          : () async {
              if (widget.onRefresh != null) {
                widget.onRefresh(() {
                  this._controller.finishRefresh();
                });
              } else {
                await Future.delayed(Duration(seconds: 2), () {
                  this._controller.finishRefresh();
                });
              }
            },
      onLoad: widget.offLoad
          ? null
          : () async {
              if (widget.onLoad != null) {
                widget.onLoad(() {
                  this._controller.finishLoad();
                });
              } else {
                await Future.delayed(Duration(seconds: 2), () {
                  this._controller.finishLoad();
                });
              }
            },
      child: widget.child,
    );
  }
}

/*
ScrollController _scroll = new ScrollController();
double _scrolOffset = 0;
  @override
  void initState() {
    this._id = widget.arguments["id"] ?? "";
    this._getCategoryInfo(this._id);
    this._getCategoryPosts(this._id, 1, refresh: true);
    // ignore: todo
    // TODO: implement initState
    super.initState();
    //切换时的事件
    //监听滚动事件，打印滚动位置
    this._scroll.addListener(() {
      this.scrollBottom(this._scroll);
    });
  }

  //滚动监控
  void scrollBottom(ScrollController scroll) {
    if (scroll.position.pixels == scroll.position.maxScrollExtent) {
      this._getCategoryPosts(this._id, this._page);
    }
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose

    this._scroll.dispose();
    super.dispose();
  }
*/
