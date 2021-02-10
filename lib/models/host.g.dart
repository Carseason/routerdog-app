// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Host _$HostFromJson(Map<String, dynamic> json) {
  return Host()
    ..hostname = json['hostname'] as String
    ..uptime = json['uptime'] as num
    ..bootTime = json['bootTime'] as num
    ..procs = json['procs'] as num
    ..os = json['os'] as String
    ..platform = json['platform'] as String
    ..platformFamily = json['platformFamily'] as String
    ..platformVersion = json['platformVersion'] as String
    ..kernelVersion = json['kernelVersion'] as String
    ..kernelArch = json['kernelArch'] as String
    ..virtualizationSystem = json['virtualizationSystem'] as String
    ..virtualizationRole = json['virtualizationRole'] as String
    ..hostId = json['hostId'] as String
    ..serverVersion = json['serverVersion'] as String;
}

Map<String, dynamic> _$HostToJson(Host instance) => <String, dynamic>{
      'hostname': instance.hostname,
      'uptime': instance.uptime,
      'bootTime': instance.bootTime,
      'procs': instance.procs,
      'os': instance.os,
      'platform': instance.platform,
      'platformFamily': instance.platformFamily,
      'platformVersion': instance.platformVersion,
      'kernelVersion': instance.kernelVersion,
      'kernelArch': instance.kernelArch,
      'virtualizationSystem': instance.virtualizationSystem,
      'virtualizationRole': instance.virtualizationRole,
      'hostId': instance.hostId,
      'serverVersion': instance.serverVersion
    };
