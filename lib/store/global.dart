import 'package:package_info/package_info.dart';
import 'dart:io';

class Global {
  String appName;
  String packageName;
  String version;
  String builNumber;
  String appOS;
  static init() {
    global = new Global();
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      global.appName = packageInfo.appName;
      global.packageName = packageInfo.packageName;
      global.version = packageInfo.version;
      global.builNumber = packageInfo.buildNumber;
      if (Platform.isIOS) {
        global.appOS = "ios";
      } else if (Platform.isAndroid) {
        global.appOS = "android";
      }
    });
  }
}

Global global;
