import 'dart:async';

import 'package:flutter/material.dart';
import 'package:routerapp/api/index.dart' as api;
import 'package:routerapp/models/index.dart' as models;
import 'package:routerapp/widgets/index.dart' as widgets;

class DeviceWidget extends StatefulWidget {
  DeviceWidget({Key key}) : super(key: key);

  @override
  _DeviceWidgetState createState() => _DeviceWidgetState();
}

class _DeviceWidgetState extends State<DeviceWidget> {
  List<models.Dhcp> dhcp = [];

  List<Widget> _dhcpTemplate() {
    var template = this.dhcp.map((item) {
      return new Container(
        margin: EdgeInsets.only(top: 5, bottom: 5),
        padding: EdgeInsets.all(10),
        decoration: new BoxDecoration(
          color: Color(0XFFffffff),
        ),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center, // 次轴元素的排序方式
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Container(
              width: 30,
              height: 30,
              margin: EdgeInsets.only(right: 10),
              child: Image.asset(
                "assets/icon/device.png",
              ),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Container(
                  alignment: Alignment.topLeft,
                  child: new Text(
                    item.hostname,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0XFF666666),
                      fontSize: 12,
                    ),
                  ),
                ),
                new SizedBox(height: 5),
                new Container(
                  alignment: Alignment.topLeft,
                  child: new Text(
                    item.ipaddr,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0XFF666666),
                      fontSize: 12,
                    ),
                  ),
                ),
                new SizedBox(height: 5),
                new Container(
                  alignment: Alignment.topLeft,
                  child: new Text(
                    item.macaddr,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0XFF666666),
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
    return template.toList();
  }

  @override
  void initState() {
    super.initState();
    this._getData();
  }

  void _getData() {
    const timeout = const Duration(seconds: 60);
    this._getAPIData();
    Timer.periodic(timeout, (timer) {
      this._getAPIData();
    });
  }

  void _getAPIData() {
    api.postSystemDHCP().then((res) {
      if (res.data["success"] == 0 && res.data["result"] != null) {
        var result = res.data["result"] ?? [];
        List<models.Dhcp> dhcp = [];
        result.forEach((item) {
          dhcp.add(models.Dhcp.fromJson(item));
        });
        setState(() {
          this.dhcp = dhcp;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: EdgeInsets.all(0),
      children: this._dhcpTemplate(),
    );
  }
}
