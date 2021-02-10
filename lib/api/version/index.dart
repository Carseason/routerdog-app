import 'package:dio/dio.dart';

Future getVersion() {
  return Dio().get(
      "https://cdn.jsdelivr.net/gh/Carseason/archive/routerdog/version.json");
}
