import 'dart:async';

import 'package:flutter/material.dart';
import 'package:routerapp/api/index.dart' as api;
import 'package:routerapp/utils/index.dart' as utils;
import 'package:routerapp/models/index.dart' as models;

class TopWidget extends StatefulWidget {
  TopWidget({Key key}) : super(key: key);

  @override
  _TopWidgetState createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {
  double usedCPU = 0.0;
  double usedMEN = 0.0;
  models.Load load = new models.Load();
  int procs = 0;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: new Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Container(
                child: new Text(
                  "平均负载",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
              new Container(
                width: 100,
                child: new Text(
                  "${this.avg}",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          new SizedBox(height: 5),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Container(
                width: 100,
                child: new Text(
                  "活跃进程",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
              new Container(
                width: 100,
                child: new Text(
                  "${this.procs}",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          new SizedBox(height: 5),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Container(
                width: 100,
                child: new Text(
                  "CPU",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
              new Container(
                width: 100,
                child: new Text(
                  "${this.usedCPU}%",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          new SizedBox(height: 5),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Container(
                width: 100,
                child: new Text(
                  "内存",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
              new Container(
                width: 100,
                child: new Text(
                  "${this.usedMEN}%",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

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

  void _getData() {
    const timeout = const Duration(seconds: 30);
    this._getAPIData();
    Timer.periodic(timeout, (timer) {
      this._getAPIData();
      // timer.cancel();
    });
  }

  void _getAPIData() async {
    var resquest = await Future.wait([
      api.postGatewayPercent(),
      api.postGatewayLoad(),
      api.postGatewayProcs(),
    ]);
    if (resquest[0] != null) {
      var res = resquest[0];
      if (res.data["success"] == 0 && res.data["result"] != null) {
        var result = res.data["result"];
        var cpu = result["cpu"] ?? 0.0;
        var men = result["men"] ?? 0.0;
        setState(() {
          this.usedCPU = utils.dobuleToPlaces(cpu, 2);
          this.usedMEN = utils.dobuleToPlaces(men, 2);
        });
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
  }
}
