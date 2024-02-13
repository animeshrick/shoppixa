part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class RegisterCall extends AuthEvent {
  final String fName, lName, email, password;

  const RegisterCall({
    required this.fName,
    required this.lName,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [];
}
