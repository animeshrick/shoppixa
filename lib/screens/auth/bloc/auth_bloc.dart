import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppixa/screens/auth/auth_repo/auth_repo.dart';

import '../../../network/dynamic_data/dynamic_data.dart';
import '../../../network/network_model/api_return_model.dart';
import '../ui/otp.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState(register: DynamicBlocData<String>.init())) {
    on<AuthEvent>((event, emit) async {
      if (event is RegisterCall) {
        emit(state.copyWith(tokenCW: DynamicBlocData.loading()));
        ApiReturnModel? resp = await AuthenticationRepo().registerApiCall(
            email: event.email,
            fName: event.fName,
            lName: event.lName,
            password: event.password);
        if (resp != null && resp.statusCode == 201) {
          emit(state.copyWith(
              tokenCW: DynamicBlocData.success(value: resp.responseString)));
          OtpView().otpPicker2(phNo: event.email);
        } else {
          emit(state.copyWith(
              tokenCW: DynamicBlocData.error(
                  message: resp?.responseString ?? "Error")));
        }
      }
    });
  }
}
