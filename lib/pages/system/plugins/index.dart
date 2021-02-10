import 'package:flutter/material.dart';

class SystemPluginsPage extends StatefulWidget {
  SystemPluginsPage({Key key}) : super(key: key);

  @override
  _SystemPluginsPageState createState() => _SystemPluginsPageState();
}

class _SystemPluginsPageState extends State<SystemPluginsPage> {
  @override
  Widget build(BuildContext context) {
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
        "插件管理",
        style: new TextStyle(
          color: Color(0XFF666666),
        ),
      ),
    );
  }

  Widget _body() {
    return new Container();
  }
}
