// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Log _$LogFromJson(Map<String, dynamic> json) {
  return Log()
    ..id = json['id'] as String
    ..type = json['type'] as String
    ..time = json['time'] as String
    ..title = json['title'] as String
    ..content = json['content'] as String;
}

Map<String, dynamic> _$LogToJson(Log instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'time': instance.time,
      'title': instance.title,
      'content': instance.content
    };
