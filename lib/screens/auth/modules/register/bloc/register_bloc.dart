import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppixa/utils/logger.dart';
import 'package:shoppixa/utils/pop_up/popup_items.dart';

import '../../../../../network/dynamic_data/dynamic_data.dart';
import '../../../../../network/network_model/api_return_model.dart';
import '../../../auth_repo/auth_repo.dart';
import '../../otp/ui/otp.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc()
      : super(RegisterState(
          register: DynamicBlocData<String>.init(),
          showPassword: DynamicBlocData<bool>.init(value: false),
          showConfPassword: DynamicBlocData<bool>.init(value: false),
        )) {
    on<RegisterEvent>((event, emit) async {
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
          // Map<String,dynamic> errMsg = json.decode(resp?.responseString ?? "");
          String errMsg = json
              .decode(resp?.responseString ?? "")['errorMessage']
              .toString()
              .split(":")[1]
              .trim();
          PopUpItems().toastMessage(errMsg, Colors.red);
          emit(state.copyWith(
              registerCW: DynamicBlocData.error(message: errMsg)));
        }
      }

      ///
      else if (event is ShowHidePassword) {
        emit(state.copyWith(showPasswordCW: DynamicBlocData.loading()));
        // if (TextUtils().isTextNotEmptyOrNull(event.isShowPassword)) {
        emit(state.copyWith(
            showPasswordCW:
                DynamicBlocData.success(value: !event.isShowPassword)));
        // }
      }

      ///
      else if (event is ShowHideConfPassword) {
        emit(state.copyWith(showConfPasswordCW: DynamicBlocData.loading()));
        // if (TextUtils().isTextNotEmptyOrNull(event.isShowConfPassword)) {
        AppLog.w("message ${state.showConfPassword.value}");
        emit(state.copyWith(
            showPasswordCW: DynamicBlocData.success(
                value: (state.showConfPassword.value ?? false))));
        // }
      }
    });
  }
}
