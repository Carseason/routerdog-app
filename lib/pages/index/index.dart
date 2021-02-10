import 'package:flutter/material.dart';
import 'package:routerapp/pages/index/page/account/index.dart';
import 'package:routerapp/pages/index/page/file/index.dart';
import 'package:routerapp/pages/index/page/home/index.dart';
import 'package:routerapp/pages/index/page/tool/index.dart';
import 'package:routerapp/pages/setting/index.dart';
import 'package:routerapp/utils/index.dart' as utils;

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _currentIndex = 0;
  DateTime _lastPressedAt; //上次点击时间
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
          utils.showToast("再按一次退出");
          _lastPressedAt = DateTime.now();
          return false;
        }
        return true;
      },
      child: MaterialApp(
        home: new DefaultTabController(
          length: 4,
          child: new Scaffold(
            backgroundColor: Colors.transparent,
            body: IndexedStack(
              index: this._currentIndex,
              children: <Widget>[
                new HomePage(context: context),
                new ToolPage(context: context),
                new FilePage(context: context),
                new AccountPage(context: context),
              ],
            ),
            bottomNavigationBar: this._bottomNavigationWidget(),
          ),
        ),
      ),
    );
  }

  //底部导航
  BottomNavigationBar _bottomNavigationWidget() {
    return new BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: this._currentIndex, //默认选中第几个
      fixedColor: new Color(0xfffb89b1),
      iconSize: 20.0,
      unselectedItemColor: Colors.grey,
      onTap: (int i) {
        //选中事件
        if (i == this._currentIndex) {
          return;
        }
        switch (i) {
          case 2:
            Navigator.pushNamed(this.context, "/system/file", arguments: {
              "path": "/",
            });
            return;
        }
        setState(() {
          this._currentIndex = i;
        });
      },
      items: [
        new BottomNavigationBarItem(
          icon: new Icon(
            Icons.home,
          ),
          label: "首页",
        ),
        new BottomNavigationBarItem(
          icon: new Icon(
            Icons.settings,
          ),
          label: "工具",
        ),
        new BottomNavigationBarItem(
          icon: new Icon(
            Icons.folder,
          ),
          label: "文件",
        ),
        new BottomNavigationBarItem(
          icon: new Icon(
            Icons.person,
          ),
          label: "我的",
        ),
      ],
    );
  }
}
