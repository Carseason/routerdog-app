import 'package:flutter/material.dart';
import 'package:routerapp/api/index.dart' as api;
import 'package:routerapp/models/index.dart' as models;
import 'package:routerapp/widgets/index.dart' as widgets;

class DHCPPage extends StatefulWidget {
  DHCPPage({Key key}) : super(key: key);

  @override
  _DHCPPageState createState() => _DHCPPageState();
}

class _DHCPPageState extends State<DHCPPage> {
  List<models.Dhcp> dhcp = [];
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
    api.postSystemDHCP().then((res) {
      if (res.data["success"] == 0 && res.data["result"] != null) {
        var result = res.data["result"] ?? [];
        List<models.Dhcp> dhcp = [];
        result.forEach((item) {
          dhcp.add(models.Dhcp.fromJson(item));
        });
        setState(() {
          this.dhcp = dhcp;
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
        "DHCP租约",
        style: new TextStyle(
          color: Color(0XFF666666),
        ),
      ),
    );
  }

  Widget _body() {
    return new ListView(
      children: this._getDhcp(),
    );
  }

  List<Widget> _getDhcp() {
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
                  ),
                ),
                new SizedBox(height: 10),
                new Container(
                  alignment: Alignment.topLeft,
                  child: new Text(
                    item.ipaddr,
                    textAlign: TextAlign.left,
                  ),
                ),
                new SizedBox(height: 10),
                new Container(
                  alignment: Alignment.topLeft,
                  child: new Text(
                    item.macaddr,
                    textAlign: TextAlign.left,
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

  Widget _dhcpWidget(String title) {
    return new Container(
      height: 50,
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Color(0XFFeeeeee))),
      ),
      child: new InkWell(
        child: new Row(
          children: <Widget>[
            new Container(
              width: 25,
              height: 25,
              margin: EdgeInsets.only(right: 10),
              child: Image.asset(
                "assets/icon/device.png",
              ),
            ),
            new SizedBox(height: 10),
            new Container(
              child: new Text(title),
            ),
            new SizedBox(height: 10),
            new Container(),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}
