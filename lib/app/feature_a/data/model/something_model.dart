import 'package:json_annotation/json_annotation.dart';

part 'something_model.g.dart';

@JsonSerializable()
class SomethingModel {
  String? id;
  String? name;
  String? avatar;
  String? createdAt;

  SomethingModel({this.id, this.name, this.avatar, this.createdAt});

  factory SomethingModel.fromJson(Map<String, dynamic> json) => _$SomethingModelFromJson(json);
  Map<String, dynamic> toJson() => _$SomethingModelToJson(this);
}
