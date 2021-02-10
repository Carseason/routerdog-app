import 'package:flutter/material.dart';
import 'package:routerapp/widgets/index.dart' as widgets;
import 'package:routerapp/api/index.dart' as api;
import 'package:routerapp/models/index.dart' as models;
import 'package:routerapp/utils/index.dart' as utils;

class SystemFilePage extends StatefulWidget {
  Map arguments;
  SystemFilePage({Key key, this.arguments}) : super(key: key);

  @override
  _SystemFilePageState createState() => _SystemFilePageState();
}

class _SystemFilePageState extends State<SystemFilePage> {
  bool load = false;
  List<models.File> files = [];
  @override
  void initState() {
    super.initState();
    this._getData();
  }

  void _getData() {
    this._getAPIData();
  }

  void _getAPIData() {
    api.postFileServerList({
      "path": widget.arguments["path"] ?? "/",
    }).then((res) {
      if (res.data["success"] == 0 && res.data["result"] != null) {
        var result = res.data["result"] ?? [];
        List<models.File> files = [];
        result.forEach((item) {
          files.add(models.File.fromJson(item));
        });
        setState(() {
          this.files = files;
          this.load = true;
        });
      } else {
        setState(() {
          this.load = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return this.load
        ? new Scaffold(
            backgroundColor: Color(0XFFffffff),
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
        widget.arguments["path"] ?? "文件管理",
        style: new TextStyle(
          color: Color(0XFF666666),
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _body() {
    return new ListView(
      children: this._getFileList(),
    );
  }

  List<Widget> _getFileList() {
    var template = this.files.map((item) {
      return item.isDir == true
          ? this._dirWidget(item)
          : this._fileWidget(item);
    });
    return template.toList();
  }

  Widget _dirWidget(models.File item) {
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
                "assets/icon/dir.png",
              ),
            ),
            new Container(
              width: 300,
              child: new Text(
                item.fileName,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.pushNamed(this.context, "/system/file", arguments: {
            "path": item.filePath,
          });
        },
      ),
    );
  }

  Widget _fileWidget(models.File item) {
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
                "assets/icon/other.png",
              ),
            ),
            new Container(
              width: 300,
              child: new Text(
                item.fileName,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            new Container(),
          ],
        ),
        onTap: () {
          utils.ShowToast("敬请期待");
        },
      ),
    );
  }
}
