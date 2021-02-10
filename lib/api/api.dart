import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:routerapp/utils/index.dart' as utils;

Dio dios;
Function initDios(SharedPreferences _prefs) {
  dios = new Dio(BaseOptions(
    // baseUrl: "http://192.168.55.67:9932/api",
    headers: {},
    connectTimeout: 2000,
    receiveTimeout: 2000,
  ));
  dios.interceptors.add(
    InterceptorsWrapper(
      //请求拦截器
      onRequest: (RequestOptions options) async {
        String host = _prefs.getString("login") ?? "";
        String pass = _prefs.getString("password") ?? "";
        options.baseUrl = "$host/api";
        options.headers["ksapprequest"] =
            "de720521-0050-43ef-9b70-4cfe447d1a91";
        options.headers["ksuser"] = pass;
        return options;
      },

      //响应拦截器
      onResponse: (Response res) async {
        if (res.request.method == "POST" && res.data["message"] != null) {
          utils.ShowToast(res.data["message"]);
        }
        return res;
      },
      //异常
      onError: (DioError err) async {
        //  utils.ShowToast("网络似乎有些问题");
        return err;
      },
    ),
  );
}

Future saveFile(String src) {
  return dios.get(
    src,
    options: Options(responseType: ResponseType.bytes),
  );
}
