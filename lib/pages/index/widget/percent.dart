import 'dart:async';

import 'package:flutter/material.dart';
import 'package:routerapp/pages/index/widget/cpu.dart';
import 'package:routerapp/api/index.dart' as api;
import 'package:routerapp/utils/index.dart' as utils;

class PercentWidget extends StatefulWidget {
  PercentWidget({Key key}) : super(key: key);

  @override
  _PercentWidgetState createState() => _PercentWidgetState();
}

class _PercentWidgetState extends State<PercentWidget> {
  double usedCPU = 0.0;
  double usedMEN = 0.0;
  @override
  void initState() {
    super.initState();
    this._getData();
  }

  @override
  Widget build(BuildContext context) {
    return new GridView.count(
      primary: false,
      shrinkWrap: true,
      crossAxisSpacing: 7.5,
      mainAxisSpacing: 7.5,
      crossAxisCount: 2,
      childAspectRatio: 1,
      children: <Widget>[
        this._getCPUWidget(),
        this._getMENWidget(),
      ],
    );
  }

  Widget _getCPUWidget() {
    return new Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, 0.7),
      ),
      child: CPUWidget(this.usedCPU, "CPU"),
    );
  }

  Widget _getMENWidget() {
    return new Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, 0.7),
      ),
      child: CPUWidget(this.usedMEN, "内存"),
    );
  }

  void _getData() {
    const timeout = const Duration(seconds: 10);
    this._getAPIData();
    Timer.periodic(timeout, (timer) {
      this._getAPIData();
    });
  }

  void _getAPIData() {
    api.postGatewayPercent().then((res) {
      if (res.data["success"] == 0 && res.data["result"] != null) {
        var result = res.data["result"];
        var cpu = result["cpu"] ?? 0.0;
        var men = result["men"] ?? 0.0;
        cpu = utils.dobuleToPlaces(cpu, 2);
        men = utils.dobuleToPlaces(men, 2);
        setState(() {
          this.usedCPU = cpu;
          this.usedMEN = men;
        });
      }
    });
  }
}
