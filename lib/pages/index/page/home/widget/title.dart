import 'package:flutter/material.dart';
import 'package:routerapp/api/index.dart' as api;

class TitleWidget extends StatefulWidget {
  TitleWidget({Key key}) : super(key: key);

  @override
  _TitleWidgetState createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget> {
  String title = "";
  @override
  void initState() {
    super.initState();
    this._getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  void _getData() {
    this._getAPIData();
  }

  void _getAPIData() {
    api.postGatewayHost().then((res) {
      if (res.data["success"] == 0 && res.data["result"] != null) {
        var result = res.data["result"];
        setState(() {
          this.title = result["hostname"] ?? "未命名设备";
        });
      }
    });
  }
}
