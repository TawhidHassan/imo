// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['_id'] as String?,
      json['employeeId'] as String?,
      json['phoneNumber'] as String?,
      json['name'] as String?,
      json['flag'] as num?,
      json['isAssigned'] as bool?,
      json['email'] as String?,
      json['role'] as String?,
      json['image'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'employeeId': instance.employeeId,
      'phoneNumber': instance.phoneNumber,
      'name': instance.name,
      'flag': instance.flag,
      'isAssigned': instance.isAssigned,
      'email': instance.email,
      'role': instance.role,
      'image': instance.image,
    };
