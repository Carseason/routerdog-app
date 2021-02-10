import 'package:flutter/material.dart';

class InfoWidget extends StatefulWidget {
  BuildContext context;
  InfoWidget({this.context, Key key}) : super(key: key);

  @override
  _InfoWidgetState createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {
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
                  "assets/icon/pid.png",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              new SizedBox(height: 10),
              new Text(
                "设备信息",
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
        Navigator.pushNamed(widget.context, "/system/info");
      },
    );
    ;
  }
}
