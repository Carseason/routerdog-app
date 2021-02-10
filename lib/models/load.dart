import 'package:json_annotation/json_annotation.dart';

part 'load.g.dart';

@JsonSerializable()
class Load {
    Load();

    Map<String,dynamic> avg;
    Map<String,dynamic> misc;
    
    factory Load.fromJson(Map<String,dynamic> json) => _$LoadFromJson(json);
    Map<String, dynamic> toJson() => _$LoadToJson(this);
}
