import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? userName;
  int? userAge;
  int? userPhoneNumber;
  String userEmail;
  String userPassword;
  

  UserModel({
    this.userName,
    this.userAge,
    this.userPhoneNumber,
   required this.userEmail,
   required this.userPassword,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}


 