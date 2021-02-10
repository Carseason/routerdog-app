import 'package:flutter/material.dart';

/*
    底板
*/

showBottomModal(
  BuildContext context, //组件上下文
  Map<String, Function> data,
) {
  List<Widget> dataWidget = <Widget>[];
  data.forEach((key, value) {
    dataWidget.add(
      new InkWell(
        child: new Container(
          alignment: Alignment.center,
          height: 50,
          decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: Color(0XFFeeeeee))),
          ),
          child: new Text(
            key,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        onTap: () {
          value();
          Navigator.of(context).pop();
        },
      ),
    );
  });
  dataWidget.add(
    new InkWell(
      child: new Container(
        alignment: Alignment.center,
        height: 50,
        child: new Text(
          "取消",
          style: TextStyle(
            fontSize: 15,
            color: Color(0XFFf73131),
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).pop();
      },
    ),
  );

  return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return new Container(
          height: (dataWidget.length) * 50.0,
          child: Column(
            children: dataWidget,
          ),
        );
      });
}
