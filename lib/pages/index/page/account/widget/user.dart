import 'package:flutter/material.dart';
import 'package:routerapp/store/index.dart' as store;

class UserWidget extends StatefulWidget {
  UserWidget({Key key}) : super(key: key);

  @override
  _UserWidgetState createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  String get _uid {
    return store.user.uid;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      child: new Column(
        children: <Widget>[
          new Container(
            alignment: Alignment.center,
            child: new InkWell(
              child: new Container(
                height: 80,
                padding: EdgeInsets.only(left: 10, right: 10),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center, // 次轴元素的排序方式
                  mainAxisSize: MainAxisSize.max,

                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Container(
                          margin: EdgeInsets.only(right: 10.0),
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                "assets/image/avatar.png",
                              ),
                            ),
                          ),
                        ),
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Container(
                              width: 260.0,
                              child: Text(
                                "用户",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            new Container(
                              width: 260.0,
                              child: Text(
                                "${this._uid}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
