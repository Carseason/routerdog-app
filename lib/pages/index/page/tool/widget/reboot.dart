import 'dart:async';

import 'package:flutter/material.dart';
import 'package:routerapp/utils/index.dart' as utils;
import 'package:routerapp/api/index.dart' as api;

class RebootWidget extends StatefulWidget {
  RebootWidget({Key key}) : super(key: key);

  @override
  _RebootWidgetState createState() => _RebootWidgetState();
}

class _RebootWidgetState extends State<RebootWidget> {
  @override
  Widget build(BuildContext context) {
    return new InkWell(
      child: new Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Color.fromRGBO(233, 233, 233, 1),
            width: 1,
          ),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(3.0),
            bottomLeft: Radius.circular(3.0),
          ),
        ),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                width: 30,
                height: 30,
                child: new Image.asset(
                  "assets/icon/reboot.png",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              new SizedBox(height: 10),
              new Text(
                "设备重启",
                style: TextStyle(
                  color: Color(0XFF666666),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        this._rebootFunc();
      },
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
