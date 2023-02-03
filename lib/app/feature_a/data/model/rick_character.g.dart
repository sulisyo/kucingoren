// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rick_character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RickCharacter _$RickCharacterFromJson(Map<String, dynamic> json) =>
    RickCharacter(
      name: json['name'] as String?,
      status: json['status'] as String?,
      image: json['image'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$RickCharacterToJson(RickCharacter instance) =>
    <String, dynamic>{
      'name': instance.name,
      'status': instance.status,
      'image': instance.image,
      'id': instance.id,
    };
