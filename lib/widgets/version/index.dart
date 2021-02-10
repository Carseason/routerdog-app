import 'package:flutter/material.dart';
import 'package:routerapp/api/index.dart' as api;
import 'package:routerapp/store/index.dart' as store;
import 'package:routerapp/utils/index.dart' as utils;

void showUpdateVersion(BuildContext context) {
  api.getVersion().then((res) {
    if (res.data != null) {
      var os = res.data[store.global.appOS];
      if (os != null) {
        var version = os["version"];
        var downloadUrl = os["downloadUrl"];
        if (version != store.global?.version &&
            downloadUrl != null &&
            downloadUrl != "") {
          utils.showDialog(
            context: context,
            title: "版本更新",
            content: "发现新版本($version)，是否立即更新？",
            success: () {
              utils.openUrl(downloadUrl);
            },
          );
          return;
        }
      }
    }
    utils.showToast("已经是最新版啦");
  });
}
