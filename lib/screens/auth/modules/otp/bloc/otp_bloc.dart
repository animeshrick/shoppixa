import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppixa/resources/local_storeage/token_sp/token_sp.dart';
import 'package:shoppixa/utils/pop_up/popup_items.dart';
import 'package:shoppixa/utils/routes/navigation_context.dart';
import 'package:shoppixa/utils/text_utils.dart';

import '../../../../../network/dynamic_data/dynamic_data.dart';
import '../../../../../network/network_model/api_return_model.dart';
import '../../../../../utils/routes/route_names.dart';
import '../../../auth_repo/auth_repo.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc() : super(OtpState(verifyOTP: DynamicBlocData<String>.init())) {
    on<OtpEvent>((event, emit) async {
      ///
      if (event is VerifyOTPEvent) {
        TokenSP().init();
        emit(state.copyWith(verifyOTPCW: DynamicBlocData.loading()));
        ApiReturnModel? resp = await AuthenticationRepo()
            .verifyOTPApiCall(email: event.email, otp: event.otp);
        if (resp != null && resp.statusCode == 200) {
          emit(state.copyWith(
              verifyOTPCW:
                  DynamicBlocData.success(value: resp.responseString)));

          Map<String, dynamic> tokenData =
              json.decode(resp.responseString ?? "")["token"];
          if (TextUtils().isTextNotEmptyOrNull(tokenData)) {
            TokenSP().saveAccessToken(tokenData['access']);
            TokenSP().saveRefreshToken(tokenData['refresh']);
            //CustomRoute().back();
            CurrentContext().context.goNamed(MyRoutes.home);
          }
        } else {
          String? errMsg = json
              .decode(resp?.responseString ?? "")['errorMessage']
              .toString()
              .split(":")[1]
              .trim();
          PopUpItems().popUpAlertNoTitle(
              context: CurrentContext().context,
              content: errMsg,
              onPressedOk: () {
                CurrentContext().context.pop();
              });
          emit(state.copyWith(
              verifyOTPCW: DynamicBlocData.error(message: errMsg)));
        }
      }
    });
  }
}
