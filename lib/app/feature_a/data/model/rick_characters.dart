

import 'package:json_annotation/json_annotation.dart';

import 'rick_character.dart';
part 'rick_characters.g.dart';

@JsonSerializable()
class RickCharacters {
  Info? info;
  List<RickCharacter>? results;

  RickCharacters({this.info, this.results});

  factory RickCharacters.fromJson(Map<String, dynamic> json) => _$RickCharactersFromJson(json);
  Map<String, dynamic> toJson() => _$RickCharactersToJson(this);
}

@JsonSerializable()
class Info {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  Info({this.count = 0, this.pages = 0, this.next, this.prev});

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
  Map<String, dynamic> toJson() => _$InfoToJson(this);
}
