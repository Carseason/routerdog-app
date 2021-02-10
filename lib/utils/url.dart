//拉起新链接
import 'package:url_launcher/url_launcher.dart';

void openUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      //   forceWebView: true, //内部打开
      //   enableJavaScript: true, //加载js
    );
  } else {
    throw 'Could not launch $url';
  }
}
