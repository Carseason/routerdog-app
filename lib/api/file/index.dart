import '../api.dart';
import 'package:routerapp/store/index.dart' as store;

Future postFileServerList(dynamic data) {
  return dios.post(
    "/file/list",
    data: data,
  );
}

String fileViewPath(String path) {
  return "/api/file/view?token=${store.user.uid}&path=$path";
}
