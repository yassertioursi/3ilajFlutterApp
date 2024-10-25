import 'package:flutter_application_1/features/auth/domain/entities/user.dart';

class UserAuthModel extends UserAuth {
  const UserAuthModel(super.firstName, super.lastName, super.email,
      super.phoneNumber, super.password, super.passwordconfirmation,
      {required super.id});

  factory UserAuthModel.fromJson(Map<String, dynamic> json) {
    return UserAuthModel(json['firstName'], json['lastName'], json['email'],
        json['phoneNumber'], json['password'], json['passwordconfirmation'],
        id: json['id']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastNamr': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      "password_confirmation": passwordconfirmation,
    };
  }
}
