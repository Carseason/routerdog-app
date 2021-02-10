import '../api.dart';

Future postAuthInfo() {
  return dios.post(
    "/auth/info",
    data: null,
  );
}
