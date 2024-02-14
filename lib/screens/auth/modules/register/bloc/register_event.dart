part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisterCall extends RegisterEvent {
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

class ShowHidePassword extends RegisterEvent {
  final bool isShowPassword;

  const ShowHidePassword(this.isShowPassword);

  @override
  List<Object?> get props => [];
}

class ShowHideConfPassword extends RegisterEvent {
  /*final bool isShowConfPassword;

  const ShowHideConfPassword(this.isShowConfPassword);*/

  @override
  List<Object?> get props => [];
}
