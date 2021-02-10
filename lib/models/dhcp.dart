import 'package:json_annotation/json_annotation.dart';

part 'dhcp.g.dart';

@JsonSerializable()
class Dhcp {
    Dhcp();

    String expires;
    String hostname;
    String ipaddr;
    String macaddr;
    
    factory Dhcp.fromJson(Map<String,dynamic> json) => _$DhcpFromJson(json);
    Map<String, dynamic> toJson() => _$DhcpToJson(this);
}
