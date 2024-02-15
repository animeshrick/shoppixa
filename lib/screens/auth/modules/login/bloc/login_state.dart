part of 'login_bloc.dart';

class LoginState extends Equatable {
  final DynamicBlocData<String> login;

  const LoginState({
    required this.login,
  });

  LoginState copyWith({DynamicBlocData<String>? loginStateCW}) {
    return LoginState(login: loginStateCW ?? login);
  }

  @override
  List<Object?> get props => [login.status];
}
