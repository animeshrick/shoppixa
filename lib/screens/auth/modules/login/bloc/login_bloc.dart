import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../network/dynamic_data/dynamic_data.dart';
import '../../../../../network/network_model/api_return_model.dart';
import '../../../../../resources/local_storeage/token_sp/token_sp.dart';
import '../../../../../utils/pop_up/popup_items.dart';
import '../../../../../utils/routes/navigation_context.dart';
import '../../../../../utils/routes/route_names.dart';
import '../../../auth_repo/auth_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState(login: DynamicBlocData<String>.init())) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginCall) {
        TokenSP().init();
        emit(state.copyWith(loginStateCW: DynamicBlocData.loading()));
        ApiReturnModel? resp = await AuthenticationRepo()
            .loginApiCall(email: event.email, password: event.password);
        if (resp != null && resp.statusCode == 200) {
          emit(state.copyWith(
              loginStateCW:
                  DynamicBlocData.success(value: resp.responseString)));

          Map<String, dynamic> tokenData =
              json.decode(resp.responseString ?? "")["token"];

          TokenSP().saveAccessToken(tokenData['access']);
          TokenSP().saveRefreshToken(tokenData['refresh']);
          CurrentContext().context.goNamed(MyRoutes.home);
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
              loginStateCW: DynamicBlocData.error(message: errMsg)));
        }
      }
    });
  }
}
