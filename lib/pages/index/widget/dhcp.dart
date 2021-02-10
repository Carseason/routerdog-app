import 'dart:async';

import 'package:flutter/material.dart';
import 'package:routerapp/api/index.dart' as api;
import 'package:routerapp/models/index.dart' as models;

class DHCPWidget extends StatefulWidget {
  DHCPWidget({Key key}) : super(key: key);

  @override
  _DHCPWidgetState createState() => _DHCPWidgetState();
}

class _DHCPWidgetState extends State<DHCPWidget> {
  int dhcpCount = 0;
  models.Load load = new models.Load();
  int procs = 0;
  @override
  void initState() {
    super.initState();
    this._getData();
  }

  String get avg {
    String avg = "";
    var avgs = this.load?.avg;
    if (avgs?.keys != null) {
      avgs.forEach((_, v) {
        avg += "$v  ";
      });
    }
    return avg;
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.7),
          ),
          padding: EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          child: new Column(
            children: <Widget>[
              this._listWidget("总上传量：", "未计算"),
              this._listWidget("总下载量：", "未计算"),
              this._listWidget("平均负载：", "${this.avg}"),
              this._listWidget("DHCP设备：", "${this.dhcpCount}"),
              this._listWidget("活跃进程：", "${this.procs}"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _listWidget(String title, dynamic value) {
    return new Container(
      height: 50,
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          new Container(
            width: 100,
            child: new Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          new Container(
            width: 100,
            child: new Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _getData() {
    this._getAPIData();
    const timeout = const Duration(seconds: 60);
    Timer.periodic(timeout, (timer) {
      this._getAPIData();
    });
  }

  void _getAPIData() async {
    var resquest = await Future.wait([
      api.postSystemDHCP(),
      api.postGatewayLoad(),
      api.postGatewayProcs(),
    ]);
    int dhcpCount = 0;
    int procs = 0;
    models.Load load;
    if (resquest[0] != null) {
      var res = resquest[0];
      if (res.data["result"] != null) {
        var result = res.data["result"] ?? [];
        dhcpCount = result.length;
      }
    }
    if (resquest[1] != null) {
      var res = resquest[1];
      if (res.data["result"] != null) {
        var result = res.data["result"];
        load = models.Load.fromJson(result);
      }
    }
    if (resquest[2] != null) {
      var res = resquest[2];
      if (res.data["result"] != null) {
        var result = res.data["result"];
        procs = result["procs"];
      }
    }
    setState(() {
      this.dhcpCount = dhcpCount;
      this.load = load;
      this.procs = procs;
    });
  }
}
