import '../api.dart';

Future postGatewayCpu() {
  return dios.post(
    "/gateway/sutil/cpu",
    data: null,
  );
}

Future postGatewayPercent() {
  return dios.post(
    "/gateway/sutil/percent",
    data: null,
  );
}

Future postGatewayMen() {
  return dios.post(
    "/gateway/sutil/men",
    data: null,
  );
}

Future postGatewayHost() {
  return dios.post(
    "/gateway/sutil/host",
    data: null,
  );
}

Future postGatewayLoad() {
  return dios.post(
    "/gateway/sutil/load",
    data: null,
  );
}

Future postGatewayProcs() {
  return dios.post(
    "/gateway/sutil/procs",
    data: null,
  );
}
