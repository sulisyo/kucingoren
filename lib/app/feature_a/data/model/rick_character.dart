import 'package:json_annotation/json_annotation.dart';

part 'rick_character.g.dart';

@JsonSerializable()
class RickCharacter {
  final String? name;
  final String? status;
  final String? image;
  final int? id;

  RickCharacter({this.name, this.status, this.image, this.id});

  //
  // RickCharacter.fromJson(Map json)
  //     : name = json['name'],
  //       status = json['status'],
  //       image = json['image'],
  //       id = json['id'];


  factory RickCharacter.fromJson(Map<String, dynamic> json) => _$RickCharacterFromJson(json);
  Map<String, dynamic> toJson() => _$RickCharacterToJson(this);
}
