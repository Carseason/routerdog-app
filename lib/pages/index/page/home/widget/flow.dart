import 'package:flutter/material.dart';

class FlowWidget extends StatefulWidget {
  FlowWidget({Key key}) : super(key: key);

  @override
  _FlowWidgetState createState() => _FlowWidgetState();
}

class _FlowWidgetState extends State<FlowWidget> {
  String up = "未计算";
  String down = "未计算";
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Container(
            child: new Row(
              children: <Widget>[
                new Text(
                  this.up,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                new SizedBox(width: 5),
                new Column(
                  children: <Widget>[
                    new Text(
                      "上传",
                      style: TextStyle(color: Colors.white, fontSize: 8),
                    ),
                    new Text(
                      "KB/s",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),
          new Container(
            width: 80,
            height: 80,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              border: Border(
                top: BorderSide(width: 2, color: Color(0XFFeeeeee)),
                left: BorderSide(width: 2, color: Color(0XFFeeeeee)),
                right: BorderSide(width: 2, color: Color(0XFFeeeeee)),
                bottom: BorderSide(width: 2, color: Color(0XFFeeeeee)),
              ),
            ),
            child: new Image.asset(
              "assets/icon/router.png",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          new Container(
            child: new Row(
              children: <Widget>[
                new Text(
                  this.down,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                new SizedBox(width: 5),
                new Column(
                  children: <Widget>[
                    new Text(
                      "下载",
                      style: TextStyle(color: Colors.white, fontSize: 8),
                    ),
                    new Text(
                      "KB/s",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
