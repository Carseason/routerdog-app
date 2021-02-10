import 'package:flutter_easyloading/flutter_easyloading.dart';

void ShowLoading({String msg}) {
  EasyLoading.show(status: msg);
  return;
}

void CloseLoading() {
  EasyLoading.dismiss();
  return;
}

void showToast(String msg) {
  EasyLoading.showToast(msg);
}
