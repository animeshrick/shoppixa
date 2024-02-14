part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final DynamicBlocData<String> register;
  final DynamicBlocData<bool> showPassword;
  final DynamicBlocData<bool> showConfPassword;

  const RegisterState(
      {required this.register,
      required this.showPassword,
      required this.showConfPassword});

  RegisterState copyWith({
    DynamicBlocData<String>? registerCW,
    DynamicBlocData<bool>? showPasswordCW,
    DynamicBlocData<bool>? showConfPasswordCW,
  }) {
    return RegisterState(
      register: registerCW ?? register,
      showPassword: showPasswordCW ?? showPassword,
      showConfPassword: showConfPasswordCW ?? showConfPassword,
    );
  }

  @override
  List<Object?> get props =>
      [register.status, showPassword.status, showConfPassword.status];
}
