part of 'otp_bloc.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();
}

class VerifyOTPEvent extends OtpEvent {
  final String email, otp;

  const VerifyOTPEvent({required this.email, required this.otp});

  @override
  List<Object?> get props => [];
}
