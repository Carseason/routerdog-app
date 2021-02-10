import 'dart:async';

import 'package:flutter/material.dart';
import 'package:routerapp/utils/index.dart' as utils;
import 'package:routerapp/api/index.dart' as api;

class SystemOptionsPage extends StatefulWidget {
  SystemOptionsPage({Key key}) : super(key: key);

  @override
  _SystemOptionsPageState createState() => _SystemOptionsPageState();
}

class _SystemOptionsPageState extends State<SystemOptionsPage> {
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
        "设备管理",
        style: new TextStyle(
          color: Color(0XFF666666),
        ),
      ),
    );
  }

  Widget _body() {
    return new Column(
      children: <Widget>[
        new SizedBox(height: 20),
        this._valueWidget("重启设备", "", onTap: () {
          this._rebootFunc();
        }),
      ],
    );
  }

  Widget _valueWidget(String title, dynamic value, {Function() onTap}) {
    return new Container(
      height: 50.0,
      decoration: new BoxDecoration(
        color: Color(0XFFffffff),
      ),
      child: new InkWell(
        child: new Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: new Container(
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1, color: Color(0XFFeeeeee))),
            ),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center, // 次轴元素的排序方式
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Container(
                  child: new Text(
                    title,
                    style: new TextStyle(
                      color: Color(0XFF000000),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                new Text(
                  "$value",
                  style: new TextStyle(
                    color: Color(0XFF666666),
                  ),
                ),
                new Icon(
                  Icons.chevron_right,
                  color: Color(0XFF999999),
                ),
              ],
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  void _rebootFunc() {
    utils.showDialog(
      context: context,
      content: "确定要重启路由器吗?",
      success: () {
        api.postSystemReboot().then((res) {
          if (res.statusCode == 200 && res.data["success"] == 0) {
            utils.ShowLoading(msg: "正在重启中...");
            const timeout = const Duration(seconds: 30);
            Timer.periodic(timeout, (timer) {
              api.postAuthInfo().then((res) {
                if (res.statusCode == 200 && res.data["success"] == 0) {
                  utils.CloseLoading();
                  utils.ShowToast("重启已完成");
                  timer.cancel(); // 取消定时器
                }
              });
            });
          }
        });
      },
    );
  }
}
