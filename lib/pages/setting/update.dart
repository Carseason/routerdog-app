import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:routerapp/widgets/index.dart' as widgets;

class UpdateWidget extends StatefulWidget {
  UpdateWidget({Key key}) : super(key: key);

  @override
  _UpdateWidgetState createState() => _UpdateWidgetState();
}

class _UpdateWidgetState extends State<UpdateWidget> {
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
                new Row(
                  children: [
                    new Container(
                      child: new Text(
                        "检测更新",
                        style: new TextStyle(
                          color: Color(0XFF000000),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Container(
                      width: 200,
                      alignment: Alignment.centerRight,
                      child: new Text(
                        "",
                        style: new TextStyle(
                          color: Color(0XFF666666),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    new Icon(
                      Icons.chevron_right,
                      color: Color(0XFF999999),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          widgets.showUpdateVersion(context);
        },
      ),
    );
  }
}
