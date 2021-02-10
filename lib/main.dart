import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import './init/index.dart';
import './router/index.dart' as router;

void main(List<String> args) {
  print("初始化数据");
  WidgetsFlutterBinding.ensureInitialized();
  Initiali.init().then((e) {
    print("初始化结束");
    SystemChrome.setSystemUIOverlayStyle(
      new SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, //状态栏颜色
        systemNavigationBarColor: Colors.black, //系统导航栏颜色
        //  systemNavigationBarDividerColor: Colors.white, //系统导航栏分割线颜色
        //  systemNavigationBarIconBrightness, //图标亮度
        //  statusBarBrightness,   //状态栏亮度
        //  statusBarIconBrightness,   //状态栏图标亮度
      ),
    );
    runApp(
      new routerapp(),
    );
  });
}

class routerapp extends StatelessWidget {
  const routerapp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false, //去掉右上角DEBUG标签
      onGenerateRoute: router.onGenerateRoute,
      initialRoute: router.initialRoute, //初始化加载的路由
      builder: EasyLoading.init(),
    );
  }
}
