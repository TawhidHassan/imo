// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['_id'] as String?,
      json['phoneNumber'] as String?,
      json['name'] as String?,
      json['points'] as num?,
      json['online'] as bool?,
      json['role'] as String?,
      json['image'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'name': instance.name,
      'points': instance.points,
      'online': instance.online,
      'role': instance.role,
      'image': instance.image,
    };
