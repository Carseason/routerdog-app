// 格式化时间
import 'package:intl/intl.dart';

String formTime(String date) {
  DateTime t = DateTime.parse(date);
  return DateFormat("yyyy-MM-dd").format(t);
}

// 时间戳转为日期
String SecondToTime(int second) {
  DateTime t = DateTime.fromMillisecondsSinceEpoch(second * 1000);
  return DateFormat("yyyy-MM-dd hh:mm").format(t);
}

// 秒转为实际时间
String SecondToValue(int second) {
  if (second < 60) {
    return "$second秒";
  }
  if (second < 3600) {
    second = (second / 60).toInt();
    return "$second分钟";
  }

  second = (second / 3600).toInt();
  return "$second小时";
}
