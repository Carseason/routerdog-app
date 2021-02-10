import 'package:flutter/material.dart';
import 'package:routerapp/pages/setting/cache.dart';
import 'package:routerapp/pages/setting/download.dart';
import 'package:routerapp/pages/setting/update.dart';
import 'package:routerapp/pages/setting/version.dart';

// ignore: must_be_immutable
class SettingPage extends StatefulWidget {
  Map arguments;
  BuildContext context;
  SettingPage({this.context, Key key, this.arguments}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    context = widget.context;
    return new Scaffold(
      backgroundColor: Color(0XFFeeeeee),
      appBar: this._appBar(),
      body: this._body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      toolbarHeight: 50,
      elevation: 1, //appbar的阴影
      backgroundColor: Color(0XFFffffff), //把appbar的背景色改成透明
      brightness: Brightness.light, //设置系统状态栏字体颜色
      iconTheme: new IconThemeData(
        color: Colors.black,
      ),
      title: new Text(
        "设置",
        style: new TextStyle(
          color: Color(0XFF666666),
        ),
      ),
    );
  }

  Widget _body() {
    return new Column(children: <Widget>[
      new Container(height: 20),
      new DownloadWidget(),
      new CacheWidget(),
      new Container(height: 20),
      new VersionWidget(),
      new UpdateWidget(),
    ]);
  }
}
