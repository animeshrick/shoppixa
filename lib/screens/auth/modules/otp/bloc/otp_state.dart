part of 'otp_bloc.dart';

class OtpState extends Equatable {
  final DynamicBlocData<String> verifyOTP;

  const OtpState({
    required this.verifyOTP,
  });

  OtpState copyWith({DynamicBlocData<String>? verifyOTPCW}) {
    return OtpState(verifyOTP: verifyOTPCW ?? verifyOTP);
  }

  @override
  List<Object?> get props => [verifyOTP.status];
}
