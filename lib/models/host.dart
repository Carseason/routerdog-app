import 'package:json_annotation/json_annotation.dart';

part 'host.g.dart';

@JsonSerializable()
class Host {
    Host();

    String hostname;
    num uptime;
    num bootTime;
    num procs;
    String os;
    String platform;
    String platformFamily;
    String platformVersion;
    String kernelVersion;
    String kernelArch;
    String virtualizationSystem;
    String virtualizationRole;
    String hostId;
    String serverVersion;
    
    factory Host.fromJson(Map<String,dynamic> json) => _$HostFromJson(json);
    Map<String, dynamic> toJson() => _$HostToJson(this);
}
