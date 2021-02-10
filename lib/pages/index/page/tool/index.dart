import 'package:flutter/material.dart';
import 'package:routerapp/pages/index/page/tool/widget/info.dart';
import 'package:routerapp/pages/index/page/tool/widget/log.dart';
import 'package:routerapp/pages/index/page/tool/widget/reboot.dart';

class ToolPage extends StatefulWidget {
  BuildContext context;
  ToolPage({this.context, Key key}) : super(key: key);

  @override
  _ToolPageState createState() => _ToolPageState();
}

class _ToolPageState extends State<ToolPage> {
  double crossAxisSpacing = 0; //水平相距间隔
  double mainAxisSpacing = 0; //垂直相距间隔
  double childAspectRatio = 1; //宽高比例
  int crossAxisCount = 4; //一行2个
  EdgeInsetsGeometry padding = EdgeInsets.only(); //内距
  @override
  Widget build(BuildContext context) {
    context = widget.context;
    return new Scaffold(
      backgroundColor: Color(0XFFeeeeee),
      appBar: this._appBar(),
      body: this._body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 1, //appbar的阴影
      backgroundColor: Colors.blue, //把appbar的背景色改成透明
      brightness: Brightness.dark, //设置系统状态栏字体颜色
      title: new Text("工具栏"),
      centerTitle: true,
    );
  }

  Widget _body() {
    return ListView(
      children: <Widget>[
        new SizedBox(height: 10),
        this._toolWidget(),
      ],
    );
  }

  Widget _toolWidget() {
    return new Column(
      children: <Widget>[
        new Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          width: double.infinity,
          child: new Text(
            "设备管理",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              color: Color(0XFF666666),
            ),
          ),
        ),
        new SizedBox(height: 10),
        new GridView.count(
          primary: false,
          shrinkWrap: true,
          crossAxisSpacing: this.crossAxisSpacing,
          mainAxisSpacing: this.mainAxisSpacing,
          crossAxisCount: this.crossAxisCount,
          childAspectRatio: this.childAspectRatio,
          padding: this.padding,
          //  controller: widget.scrollController ?? null,
          children: <Widget>[
            new InfoWidget(context: widget.context),
            new LogWidget(context: widget.context),
            new RebootWidget(),
          ],
        ),
      ],
    );
  }
}
