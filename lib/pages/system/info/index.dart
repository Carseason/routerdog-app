import 'package:flutter/material.dart';
import 'package:routerapp/api/index.dart' as api;
import 'package:routerapp/models/index.dart' as models;
import 'package:routerapp/widgets/index.dart' as widgets;
import 'package:routerapp/utils/index.dart' as utils;

class SystemInfoPage extends StatefulWidget {
  SystemInfoPage({Key key}) : super(key: key);

  @override
  _SystemInfoPageState createState() => _SystemInfoPageState();
}

class _SystemInfoPageState extends State<SystemInfoPage> {
  models.Host host;
  bool load = false;
  @override
  void initState() {
    super.initState();
    this._getData();
  }

  void _getData() {
    this._getAPIData();
  }

  void _getAPIData() {
    api.postGatewayHost().then((res) {
      if (res.data["success"] == 0 && res.data["result"] != null) {
        var result = res.data["result"];
        setState(() {
          this.host = models.Host.fromJson(result);
          this.load = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return this.load
        ? new Scaffold(
            backgroundColor: Color(0XFFeeeeee),
            appBar: this._appBar(),
            body: this._body(),
          )
        : widgets.SkeletonWidget.widget();
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
        "设备信息",
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
        this._valueWidget("设备名称", this.host.hostname),
        this._valueWidget("系统内核", this.host.os),
        this._valueWidget("系统平台", this.host.platform),
        this._valueWidget("系统版本", this.host.platformVersion),
        this._valueWidget("内核版本", this.host.kernelVersion),
        this._valueWidget("硬件平台", this.host.kernelArch),
        this._valueWidget("在线时间", utils.SecondToValue(this.host.uptime)),
        this._valueWidget("程序版本", this.host.serverVersion),
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
              ],
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
