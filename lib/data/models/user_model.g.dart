// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel()
  ..id = json['id'] as String?
  ..fullName = json['fullName'] as String?
  ..phoneNumber = json['phoneNumber'] as String?
  ..email = json['email'] as String?
  ..profilePic = json['profilePic'] as String?
  ..bio = json['bio'] as String?
  ..createdOn = json['createdOn'] == null
      ? null
      : DateTime.parse(json['createdOn'] as String)
  ..updatedOn = json['updatedOn'] == null
      ? null
      : DateTime.parse(json['updatedOn'] as String)
  ..profileProgress = json['profileProgress'] as int?;

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'profilePic': instance.profilePic,
      'bio': instance.bio,
      'createdOn': instance.createdOn?.toIso8601String(),
      'updatedOn': instance.updatedOn?.toIso8601String(),
      'profileProgress': instance.profileProgress,
    };
