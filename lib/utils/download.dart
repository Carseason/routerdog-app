import 'package:routerapp/api/index.dart' as api;
import 'package:routerapp/utils/index.dart' as utils;

import 'package:permission_handler/permission_handler.dart';
import 'dart:typed_data';
import 'package:image_gallery_saver/image_gallery_saver.dart';

//保存图片
void saveImage(String src) async {
  // 申请以下权限
  Map<Permission, PermissionStatus> statuses = await [
    Permission.storage,
  ].request();
  switch (statuses[Permission.storage]) {
    case PermissionStatus.undetermined: //未申请
    case PermissionStatus.denied: //禁止
    case PermissionStatus.permanentlyDenied: //永久拒绝
      utils.ShowToast("没有权限");
      break;
    case PermissionStatus.granted: //允许
    case PermissionStatus.restricted: //受限制的
      var response = await api.saveFile(src);
      final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
      );
      if (result != null) {
        utils.ShowToast("保存成功");
      } else {
        utils.ShowToast("保存失败");
      }
  }
}
