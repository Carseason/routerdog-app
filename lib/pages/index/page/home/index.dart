import 'package:flutter/material.dart';
import './widget/device.dart';
import './widget/flow.dart';
import './widget/top.dart';
import './widget/title.dart';

class HomePage extends StatefulWidget {
  BuildContext context;
  HomePage({this.context, Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    context = widget.context;
    return NestedScrollView(
      floatHeaderSlivers: true, //必须为true 否则监听不到子组件滚动
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          this._appBarWidget(),
        ];
      },
      body: this._bodyWidget(),
    );
  }

  SliverAppBar _appBarWidget() {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 50,
      elevation: 0, //appbar的阴影
      backgroundColor: Colors.blue, //把appbar的背景色改成透明
      brightness: Brightness.dark, //设置系统状态栏字体颜色
      pinned: true,
      floating: true,
      expandedHeight: 260.0,
      title: new TitleWidget(),
      flexibleSpace: new FlexibleSpaceBar(
        centerTitle: true,
        //   title: new TitleWidget(),
        background: this._spaceWidget(),
      ),
    );
  }

  Widget _bodyWidget() {
    return new DeviceWidget();
  }

  Widget _spaceWidget() {
    return new Container(
      padding: EdgeInsets.only(top: 50),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new FlowWidget(),
          new SizedBox(height: 20),
          new TopWidget(),
        ],
      ),
    );
  }
}
