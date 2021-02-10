import 'package:flutter/material.dart';
import 'package:routerapp/widgets/index.dart' as widgets;
import 'package:routerapp/api/index.dart' as api;
import 'package:routerapp/models/index.dart' as models;

class LogPage extends StatefulWidget {
  LogPage({Key key}) : super(key: key);

  @override
  _LogPageState createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  List<models.Log> logs = [];
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
    api.postLog().then((res) {
      if (res.data["success"] == 0 && res.data["result"] != null) {
        var result = res.data["result"] ?? [];
        List<models.Log> logs = [];
        result.forEach((item) {
          logs.add(models.Log.fromJson(item));
        });
        setState(() {
          this.logs = logs;
        });
      }
      setState(() {
        this.load = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return this.load
        ? new Scaffold(
            // backgroundColor: Color(0XFFeeeeee),
            backgroundColor: Color(0XFFffffff),
            appBar: this._appBar(),
            body: this._body(),
          )
        : widgets.SkeletonWidget.widget();
  }

  AppBar _appBar() {
    return AppBar(
      toolbarHeight: 50,
      // elevation: 1, //appbar的阴影
      elevation: 0, //appbar的阴影
      backgroundColor: Color(0XFFffffff), //把appbar的背景色改成透明
      brightness: Brightness.light, //设置系统状态栏字体颜色
      iconTheme: new IconThemeData(
        color: Colors.black,
      ),
      title: new Text(
        "",
        style: new TextStyle(
          color: Color(0XFF666666),
        ),
      ),
    );
  }

  Widget _body() {
    return ListView(
      children: this._logTemplate(),
    );
  }

  List<Widget> _logTemplate() {
    var template = this.logs.map((item) {
      return new Container(
        margin: EdgeInsets.only(top: 5, bottom: 5),
        padding: EdgeInsets.all(10),
        decoration: new BoxDecoration(
            // color: Color(0XFFffffff),
            ),
        alignment: Alignment.topLeft,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 头像
            new Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(right: 10.0),
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    "assets/image/avatar_log.png",
                  ),
                ),
              ),
            ),
            // 正文内容,使用 Expanded 包装文本换行
            new Expanded(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    decoration: new BoxDecoration(),
                    // alignment: Alignment.center,
                    // 标题
                    child: new Row(
                      children: <Widget>[
                        new Text(
                          item.title,
                          style: new TextStyle(
                            color: Color(0XFF666666),
                            fontSize: 12,
                          ),
                        ),
                        new Text(
                          "(${item.time})",
                          style: new TextStyle(
                            color: Color(0XFF666666),
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 正文
                  new Container(
                    alignment: Alignment.centerLeft,
                    child: new Text(
                      item.content,
                      style: new TextStyle(
                        color: Color(0XFF333333),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
    return template.toList();
  }
}
