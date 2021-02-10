import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:routerapp/store/index.dart' as store;
import 'package:routerapp/api/index.dart' as api;
import 'package:routerapp/utils/index.dart' as utils;

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  DateTime _lastPressedAt; //上次点击时间
  TextEditingController _login = TextEditingController();
  TextEditingController _password = TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();
  @override
  // ignore: must_call_super
  void initState() {
    //监听输入改变
    this._login.addListener(() {
      //  print(this._login.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
          //两次点击间隔超过1秒则重新计时
          utils.showToast("再按一次退出");
          _lastPressedAt = DateTime.now();
          return false;
        }
        SystemNavigator.pop();
        return true;
      },
      child: new Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/loginBg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: new Scaffold(
          backgroundColor: Colors.transparent,
          body: this._body(),
        ),
      ),
    );
  }

  Widget _body() {
    return new Container(
      child: new Form(
        key: _formKey,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new SizedBox(height: 30.0), //占位元素
            new Container(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.5),
              ),
              child: new Column(
                children: <Widget>[
                  new SizedBox(height: 30.0), //占位元素
                  new TextFormField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      controller: this._login,
                      decoration: new InputDecoration(
                        hintText: "请输入登录账号",
                        icon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        //border: new OutlineInputBorder(),
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        counterStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      validator: (v) {
                        return v.trim().length > 0 ? null : "用户名不能为空";
                      }),
                  new TextFormField(
                      obscureText: true,
                      controller: this._password,
                      decoration: new InputDecoration(
                        hintText: "请输入登录密码",
                        icon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        // border: new OutlineInputBorder(),
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        counterStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      validator: (v) {
                        return v.trim().length > 5 ? null : "密码不能少于6位";
                      }),
                  new SizedBox(height: 30.0), //占位元素
                ],
              ),
            ),
            new SizedBox(height: 30.0), //占位元素
            new Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                width: double.infinity,
                height: 40,
                child: RaisedButton(
                  child: new Text("登录"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    if ((this._formKey.currentState as FormState).validate()) {
                      this._loginUser(this._login.text, this._password.text);
                      //验证通过提交数据
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }

  //登录用户
  _loginUser(String login, String password) {
    utils.ShowLoading(msg: "登录中");
    store.Pool.setCache("login", login);
    store.Pool.setCache("password", password);
    api.postAuthInfo().then((res) {
      utils.CloseLoading();
      if (res.data["success"] == 0) {
        Navigator.pushReplacementNamed(context, '/');
      } else {
        utils.showToast("登录失败");
      }
    }).catchError((err) {
      utils.CloseLoading();
      utils.showToast("无服务连接");
    });
  }
}
