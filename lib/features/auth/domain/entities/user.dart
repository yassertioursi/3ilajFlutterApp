import 'package:equatable/equatable.dart';

class UserAuth extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String password;
  final String passwordconfirmation;

  const UserAuth(this.firstName, this.lastName, this.email, this.phoneNumber,
      this.password, this.passwordconfirmation,
      {required this.id});

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
        phoneNumber,
        password,
        passwordconfirmation
      ];

  @override
  bool? get stringify => true;
}
