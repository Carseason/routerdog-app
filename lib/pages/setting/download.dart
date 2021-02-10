import 'package:flutter/material.dart';

class DownloadWidget extends StatefulWidget {
  DownloadWidget({Key key}) : super(key: key);

  @override
  _DownloadWidgetState createState() => _DownloadWidgetState();
}

class _DownloadWidgetState extends State<DownloadWidget> {
  @override
  Widget build(BuildContext context) {
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
                    "下载管理",
                    style: new TextStyle(
                      color: Color(0XFF000000),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                new Text(
                  "",
                  style: new TextStyle(
                    color: Color(0XFF666666),
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
