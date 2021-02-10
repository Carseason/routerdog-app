import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:routerapp/pages/index/index.dart';
import 'package:routerapp/pages/login/index.dart';
import 'package:routerapp/pages/scanQrcode/index.dart';
import 'package:routerapp/pages/scanView/index.dart';
import 'package:routerapp/pages/setting/index.dart';
import 'package:routerapp/pages/system/dhcp/index.dart';
import 'package:routerapp/pages/system/file/index.dart';
import 'package:routerapp/pages/system/info/index.dart';
import 'package:routerapp/pages/system/log/index.dart';
import 'package:routerapp/pages/system/options/index.dart';
import 'package:routerapp/pages/system/plugins/index.dart';

//初始化的路由页面
String initialRoute = "/";

//路由列表
final routes = {
  "/": (context) => new IndexPage(),
  "/login": (context) => new LoginPage(),
  "/setting": (context) => new SettingPage(),
  "/scanqrcode": (context) => new ScanQrcodePage(),
  "/scanview": (context, {arguments}) => new ScanViewPage(arguments: arguments),
  "/system/info": (context) => new SystemInfoPage(),
  "/system/options": (context) => new SystemOptionsPage(),
  "/system/plugins": (context) => new SystemPluginsPage(),
  "/system/dhcp": (context) => new DHCPPage(),
  "/system/log": (context) => new LogPage(),
  "/system/file": (context, {arguments}) =>
      new SystemFilePage(arguments: arguments),
};

//处理路由
// ignore: top_level_function_literal_block
var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuider = routes[name];
  //CupertinoPageRoute    //左右切换
  //MaterialPageRoute     //上下滑动
  if (pageContentBuider != null && settings.arguments != null) {
    return new CupertinoPageRoute(builder: (BuildContext context) {
      return pageContentBuider(
        context,
        arguments: settings.arguments,
      ); //有路由值
    });
  }
  return CupertinoPageRoute(
    builder: (BuildContext context) {
      return pageContentBuider(context);
    },
  );
};

//  左右切换的路由
// ignore: top_level_function_literal_block
var showCupertinoPageRoute = (BuildContext context, Widget page) {
  Navigator.of(context).push(CupertinoPageRoute(
    builder: (BuildContext context) {
      return page;
    },
  ));
};

//  上下滑动的路由
// ignore: top_level_function_literal_block
var showMaterialPageRoute = (BuildContext context, Widget page) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (BuildContext context) {
      return page;
    },
  ));
};
