import 'package:json_annotation/json_annotation.dart';

part 'file.g.dart';

@JsonSerializable()
class File {
    File();

    String fileName;
    String fileType;
    String fileSuffix;
    String filePath;
    num fileSize;
    num fileMode;
    String fileModTime;
    String fileUrl;
    String fileIcon;
    bool isDir;
    
    factory File.fromJson(Map<String,dynamic> json) => _$FileFromJson(json);
    Map<String, dynamic> toJson() => _$FileToJson(this);
}
