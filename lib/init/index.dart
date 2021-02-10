import 'package:routerapp/api/index.dart' as api;
import 'package:routerapp/store/index.dart' as store;
import 'package:routerapp/router/index.dart' as router;
import 'package:routerapp/models/index.dart' as models;
import 'package:shared_preferences/shared_preferences.dart';

//初始化全局数据
class Initiali {
  static init() async {
    try {
      store.prefs = await SharedPreferences.getInstance();
      api.initDios(store.prefs);
      store.Global.init();
      var resquest = await Future.wait([
        api.postAuthInfo(),
      ]);
      var login = resquest[0];
      if (login.statusCode == 200 && login.data["success"] == 0) {
        var user = login.data["result"];
        if (user != null) {
          store.user = models.User.fromJson(user);
        }
        router.initialRoute = "/";
        //已经登录了
      } else {
        router.initialRoute = "/login";
      }
    } catch (err) {
      router.initialRoute = "/login";
    }
    return;
  }
}
