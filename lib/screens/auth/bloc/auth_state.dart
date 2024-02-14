part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final DynamicBlocData<String> register;
  final DynamicBlocData<bool> passwordToggle;
  final DynamicBlocData<bool> confPasswordToggle;
  final DynamicBlocData<String> verifyOTP;

  const AuthState({
    required this.register,
    required this.passwordToggle,
    required this.confPasswordToggle,
    required this.verifyOTP,
  });

  AuthState copyWith({
    DynamicBlocData<String>? registerCW,
    DynamicBlocData<bool>? passwordToggleCW,
    DynamicBlocData<bool>? confPasswordToggleCW,
    DynamicBlocData<String>? verifyOTPCW,
  }) {
    return AuthState(
      register: registerCW ?? register,
      passwordToggle: passwordToggleCW ?? passwordToggle,
      confPasswordToggle: confPasswordToggleCW ?? confPasswordToggle,
      verifyOTP: verifyOTPCW ?? verifyOTP,
    );
  }

  @override
  List<Object?> get props => [
        register.status,
        passwordToggle.status,
        confPasswordToggle.status,
        verifyOTP.status,
      ];
}
