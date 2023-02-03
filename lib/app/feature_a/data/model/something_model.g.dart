// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'something_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SomethingModel _$SomethingModelFromJson(Map<String, dynamic> json) =>
    SomethingModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$SomethingModelToJson(SomethingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'createdAt': instance.createdAt,
    };
