// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dhcp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dhcp _$DhcpFromJson(Map<String, dynamic> json) {
  return Dhcp()
    ..expires = json['expires'] as String
    ..hostname = json['hostname'] as String
    ..ipaddr = json['ipaddr'] as String
    ..macaddr = json['macaddr'] as String;
}

Map<String, dynamic> _$DhcpToJson(Dhcp instance) => <String, dynamic>{
      'expires': instance.expires,
      'hostname': instance.hostname,
      'ipaddr': instance.ipaddr,
      'macaddr': instance.macaddr
    };
