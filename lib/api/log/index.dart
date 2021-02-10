import '../api.dart';

Future postLog() {
  return dios.post("/log/list", data: {
    "limit": 100,
    "offset": 0,
  });
}
