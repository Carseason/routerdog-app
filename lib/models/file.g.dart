// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

File _$FileFromJson(Map<String, dynamic> json) {
  return File()
    ..fileName = json['fileName'] as String
    ..fileType = json['fileType'] as String
    ..fileSuffix = json['fileSuffix'] as String
    ..filePath = json['filePath'] as String
    ..fileSize = json['fileSize'] as num
    ..fileMode = json['fileMode'] as num
    ..fileModTime = json['fileModTime'] as String
    ..fileUrl = json['fileUrl'] as String
    ..fileIcon = json['fileIcon'] as String
    ..isDir = json['isDir'] as bool;
}

Map<String, dynamic> _$FileToJson(File instance) => <String, dynamic>{
      'fileName': instance.fileName,
      'fileType': instance.fileType,
      'fileSuffix': instance.fileSuffix,
      'filePath': instance.filePath,
      'fileSize': instance.fileSize,
      'fileMode': instance.fileMode,
      'fileModTime': instance.fileModTime,
      'fileUrl': instance.fileUrl,
      'fileIcon': instance.fileIcon,
      'isDir': instance.isDir
    };
