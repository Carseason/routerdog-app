import 'package:flutter/material.dart';

class LogWidget extends StatefulWidget {
  BuildContext context;
  LogWidget({this.context, Key key}) : super(key: key);

  @override
  _LogWidgetState createState() => _LogWidgetState();
}

class _LogWidgetState extends State<LogWidget> {
  @override
  Widget build(BuildContext context) {
    return new InkWell(
      child: new Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Color.fromRGBO(233, 233, 233, 1),
            width: 1,
          ),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(3.0),
            bottomLeft: Radius.circular(3.0),
          ),
        ),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                width: 30,
                height: 30,
                child: new Image.asset(
                  "assets/icon/log.png",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              new SizedBox(height: 10),
              new Text(
                "消息通知",
                style: TextStyle(
                  color: Color(0XFF666666),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(widget.context, "/system/log");
      },
    );
    ;
  }
}
