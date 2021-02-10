import '../api.dart';

Future postSystemReboot() {
  return dios.post(
    "/system/reboot",
    data: null,
  );
}

Future postSystemDHCP() {
  return dios.post(
    "/system/dhcp",
    data: null,
  );
}
