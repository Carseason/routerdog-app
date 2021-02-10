import 'package:flutter/material.dart';

class ScanViewPage extends StatelessWidget {
  Map arguments;
  ScanViewPage({Key key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0XFFffffff),
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
        "扫码结果",
        style: new TextStyle(
          color: Color(0XFF666666),
        ),
      ),
    );
  }

  Widget _body() {
    return new Container(
      padding: EdgeInsets.only(top: 20),
      child: new Text(
        this.arguments["data"].toString(),
      ),
    );
  }
}
