import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppixa/utils/routes/navigation_context.dart';
import 'package:shoppixa/utils/routes/route_names.dart';

import '../../../../../network/dynamic_data/dynamic_data.dart';
import '../../../../../network/network_model/api_return_model.dart';
import '../../../auth_repo/auth_repo.dart';

part 'otp_event.dart';

part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc() : super(OtpState(verifyOTP: DynamicBlocData<String>.init())) {
    on<OtpEvent>((event, emit) async {
      ///
      if (event is VerifyOTPEvent) {
        emit(state.copyWith(verifyOTPCW: DynamicBlocData.loading()));
        ApiReturnModel? resp = await AuthenticationRepo()
            .verifyOTPApiCall(email: event.email, otp: event.otp);
        if (resp != null && resp.statusCode == 200) {
          emit(state.copyWith(
              verifyOTPCW:
                  DynamicBlocData.success(value: resp.responseString)));
          CurrentContext().context.goNamed(MyRoutes.home);
        } else {
          emit(state.copyWith(
              verifyOTPCW: DynamicBlocData.error(
                  message: resp?.responseString ?? "Error")));
        }
      }
    });
  }
}
