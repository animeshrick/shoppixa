part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final DynamicBlocData<String> register;
  final DynamicBlocData<bool> passwordToggle;
  final DynamicBlocData<bool> confPasswordToggle;

  const AuthState({required this.register,
    required this.passwordToggle,
    required this.confPasswordToggle});

  AuthState copyWith({
    DynamicBlocData<String>? tokenCW,
    DynamicBlocData<bool>? passwordToggleCW,
    DynamicBlocData<bool>? confPasswordToggleCW,
  }) {
    return AuthState(register: tokenCW ?? register,
      passwordToggle: passwordToggleCW ? passwordToggle,
      confPasswordToggle: confPasswordToggleCW ? confPasswordToggle,
    );
  }

  @override
  List<Object?> get props =>
      [register.status, passwordToggle.status, confPasswordToggle.status,];
}
