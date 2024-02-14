import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppixa/screens/auth/auth_repo/auth_repo.dart';

import '../../../network/dynamic_data/dynamic_data.dart';
import '../../../network/network_model/api_return_model.dart';
import '../ui/otp.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc()
      : super(AuthState(
          register: DynamicBlocData<String>.init(),
          passwordToggle: DynamicBlocData<bool>.init(value: false),
          confPasswordToggle: DynamicBlocData<bool>.init(value: false),
          verifyOTP: DynamicBlocData<String>.init(),
        )) {
    on<AuthEvent>((event, emit) async {
      if (event is RegisterCall) {
        emit(state.copyWith(registerCW: DynamicBlocData.loading()));
        ApiReturnModel? resp = await AuthenticationRepo().registerApiCall(
            email: event.email,
            fName: event.fName,
            lName: event.lName,
            password: event.password);
        if (resp != null && resp.statusCode == 201) {
          emit(state.copyWith(
              registerCW: DynamicBlocData.success(value: resp.responseString)));
          OtpView().otpPicker2(phNo: event.email);
        } else {
          emit(state.copyWith(
              registerCW: DynamicBlocData.error(
                  message: resp?.responseString ?? "Error")));
        }
      }

      ///
      else if (event is VerifyOTPEvent) {
        emit(state.copyWith(verifyOTPCW: DynamicBlocData.loading()));
        ApiReturnModel? resp = await AuthenticationRepo()
            .verifyOTPApiCall(email: event.email, otp: event.otp);
        if (resp != null && resp.statusCode == 200) {
          emit(state.copyWith(
              verifyOTPCW:
                  DynamicBlocData.success(value: resp.responseString)));

        } else {
          emit(state.copyWith(
              verifyOTPCW: DynamicBlocData.error(
                  message: resp?.responseString ?? "Error")));
        }
      }
    });
  }
}
