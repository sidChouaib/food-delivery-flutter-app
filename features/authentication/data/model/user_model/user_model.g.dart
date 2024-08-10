// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    userName: json["fullName"],
    userAge: json["age"],
    userPhoneNumber: json["phoneNumber"],
    userEmail: json["email"],
    userPassword: json["password"],
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) =>
    <String, dynamic>{
      "fullName": instance.userName,
      "age": instance.userAge,
      "phoneNumber": instance.userPhoneNumber,
      "email": instance.userEmail,
      "password": instance.userPassword,
    };
