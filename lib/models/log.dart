import 'package:json_annotation/json_annotation.dart';

part 'log.g.dart';

@JsonSerializable()
class Log {
    Log();

    String id;
    String type;
    String time;
    String title;
    String content;
    
    factory Log.fromJson(Map<String,dynamic> json) => _$LogFromJson(json);
    Map<String, dynamic> toJson() => _$LogToJson(this);
}
