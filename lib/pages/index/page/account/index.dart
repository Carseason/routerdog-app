import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:routerapp/pages/index/page/account/widget/user.dart';
import 'package:routerapp/utils/index.dart' as utils;
import 'package:routerapp/store/index.dart' as store;

class AccountPage extends StatefulWidget {
  BuildContext context;
  AccountPage({Key key, this.context}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String get _uid {
    return store.Pool.getString("password") ?? "";
  }

  @override
  Widget build(BuildContext context) {
    context = widget.context;
    return new Scaffold(
      appBar: this._appBar(),
      body: this._body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0, //appbar的阴影
      backgroundColor: Colors.transparent, //把appbar的背景色改成透明
      brightness: Brightness.light, //设置系统状态栏字体颜色
      iconTheme: new IconThemeData(
        color: Color(0XFF666666),
      ),
      actions: <Widget>[
        IconButton(
          padding: EdgeInsets.all(0),
          alignment: Alignment.center,
          icon: Icon(Icons.crop_free),
          onPressed: () {
            Navigator.pushNamed(widget.context, '/scanqrcode');
          },
        ),
        IconButton(
          padding: EdgeInsets.all(0),
          alignment: Alignment.center,
          icon: Icon(Icons.settings),
          onPressed: () {
            Navigator.pushNamed(widget.context, '/setting');
          },
        ),
      ],
    );
  }

  Widget _body() {
    return new Container(
      width: double.infinity,
      child: new Column(
        children: <Widget>[
          new UserWidget(),
          // this._userWidget(),
          new Container(
            height: 10,
            decoration: new BoxDecoration(
              color: Color(0XFFeeeeee),
            ),
          ),
          this._outLoginWidget(),
        ],
      ),
    );
  }

  Widget _userWidget() {
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
                        Container(
                          width: 260.0,
                          child: Text(
                            "用户${this._uid}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
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

  Widget _outLoginWidget() {
    return this._tableList("assets/icon/outlogin.png", "注销登录", () {
      utils.showDialog(
        context: widget.context,
        content: "确定要注销登录吗?",
        success: () {
          store.Pool.removeCache("login");
          store.Pool.removeCache("password");
          this.NavigatorReplacementNamed('/login');
        },
      );
    });
  }

  Widget _tableList(String imgUrl, String title, Function() onTap) {
    return new Container(
      height: 50.0,
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
                      width: 25,
                      height: 25,
                      margin: EdgeInsets.only(right: 10),
                      child: Image.asset(
                        imgUrl,
                      ),
                    ),
                    new Container(
                      child: new Text(
                        title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                new Icon(
                  Icons.chevron_right,
                  color: Color(0XFF999999),
                ),
              ],
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  void NavigatorPush(String url, {arguments}) {
    Navigator.pushNamed(widget.context, url, arguments: arguments);
  }

  void NavigatorReplacementNamed(String url, {arguments}) {
    Navigator.pushReplacementNamed(widget.context, url);
  }
}
