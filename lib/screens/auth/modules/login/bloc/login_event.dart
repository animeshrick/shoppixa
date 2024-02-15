part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginCall extends LoginEvent {
  final String email, password;

  const LoginCall({required this.email, required this.password});

  @override
  List<Object?> get props => [];
}
