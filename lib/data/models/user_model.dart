import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? id;
  String? fullName;
  String? phoneNumber;
  String? email;
  String? profilePic;
  String? bio;
  DateTime? createdOn;
  DateTime? updatedOn;

  int? profileProgress;

  UserModel();

  factory UserModel.fromFirebaseUser(User user) {
    UserModel newUserModel = UserModel();
    newUserModel.id = user.uid;
    newUserModel.email = user.email;
    newUserModel.phoneNumber = user.phoneNumber;
    newUserModel.profileProgress = 0;
    return newUserModel;
  }

  factory UserModel.fromJson(Map<String, dynamic> map) =>
      _$UserModelFromJson(map);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
