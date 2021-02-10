import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
export 'time.dart';
export 'download.dart';
export 'url.dart';
export 'loading.dart';
export 'math.dart';
export 'toast.dart';

void showAlert({
  BuildContext context, //组件上下文
  String type, //类型
  String title, //标题
  String msg, //内容
  Function success, //确认按钮方法
  Function close, //取消按钮方法
}) {
  AlertType e;
  switch (type) {
    case "success":
      e = AlertType.success;
      break;
    case "warning":
      e = AlertType.warning;
      break;
    case "error":
      e = AlertType.error;
      break;
  }

  List<DialogButton> buttons = [];
  if (success != null) {
    buttons = [
      new DialogButton(
        child: new Text(
          "取消",
          style: new TextStyle(color: Colors.white, fontSize: 14),
        ),
        onPressed: () {
          if (close != null) {
            close();
          }
          Navigator.pop(context);
        },
        // color: Color.fromRGBO(0, 179, 134, 1.0),
      ),
      new DialogButton(
        child: Text(
          "确定",
          style: new TextStyle(color: Colors.white, fontSize: 14),
        ),
        onPressed: () {
          if (success != null) {
            success();
          }
          Navigator.pop(context);
        },
        // gradient: new LinearGradient(colors: [
        //   Color.fromRGBO(116, 116, 191, 1.0),
        //   Color.fromRGBO(52, 138, 199, 1.0)
        // ]),
      )
    ];
  } else {
    buttons = [
      new DialogButton(
        child: new Text(
          "知道了",
          style: new TextStyle(color: Colors.white, fontSize: 16),
        ),
        onPressed: () {
          if (close != null) {
            close();
          }
          Navigator.pop(context);
        },
        color: Color.fromRGBO(0, 179, 134, 1.0),
      ),
    ];
  }

  AlertStyle style = new AlertStyle(
    isCloseButton: false,
    titleStyle: new TextStyle(
      color: Color(0XFF333333),
      fontSize: 20.0,
      height: title == null ? 0 : null,
    ),
    descStyle: new TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18.0,
      color: Color(0XFF666666),
    ),
    alertBorder: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(5.0),
      side: new BorderSide(
        color: Colors.white,
      ),
    ),
    alertPadding: EdgeInsets.all(0),
  );

  Alert(
    context: context,
    type: e,
    title: title ?? "",
    desc: msg ?? "",
    buttons: buttons,
    style: style,
  ).show();
}

showDialog({
  BuildContext context, //组件上下文
  String title, //标题
  String content, //内容
  Function success, //确认按钮方法
  Function close, //取消按钮方法
}) {
  return showCupertinoDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: title != null
            ? new Container(
                child: Text(title),
              )
            : null,
        content: SizedBox(
          child: content != null
              ? new Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    content,
                  ),
                )
              : null,
        ),
        actions: [
          CupertinoDialogAction(
            child: Text('确认'),
            onPressed: () {
              Navigator.of(context).pop();
              if (success != null) {
                success();
              }
            },
          ),
          CupertinoDialogAction(
            child: Text('取消'),
            isDestructiveAction: true,
            onPressed: () {
              Navigator.of(context).pop();
              if (close != null) {
                close();
              }
            },
          ),
        ],
      );
    },
  );
}

showLoad() {
  new CupertinoActivityIndicator(
    animating: false,
    radius: 30,
  );
}
