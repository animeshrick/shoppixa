import 'package:shoppixa/network/api_repo_imp.dart';
import 'package:shoppixa/network/urls/app_urls.dart';
import 'package:shoppixa/screens/auth/model/register_request_model.dart';
import 'package:shoppixa/screens/auth/model/verify_otp_model.dart';
import 'package:shoppixa/utils/logger.dart';

import '../../../network/apirepo.dart';
import '../../../network/network_model/api_return_model.dart';

class AuthenticationRepo {
  Future<ApiReturnModel?> registerApiCall({
    required String email,
    required String fName,
    required String lName,
    required String password,
  }) async {
    try {
      RegisterRequest regPayload = RegisterRequest(
          email: email,
          fname: fName,
          lname: lName,
          password1: password,
          password2: password,
          username: fName.toLowerCase());
      ApiReturnModel? data = await apiRepo().callApi(
          tag: 'User Register',
          uri: AppUrl().register(),
          bodyData: BodyData.raw(body: regPayload.toJson()),
          method: Method.post,
          headers: {'Content-Type': 'application/json'});
      if (data?.responseString != null) {
        var resp = data?.responseString;
        /*return resp['successMessage'];*/
        return data;
      }
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
    return null;
  }

  Future<ApiReturnModel?> loginApiCall({
    required String email,
    required String fName,
    required String lName,
    required String password,
  }) async {
    try {
      RegisterRequest regPayload = RegisterRequest(
          email: email,
          fname: fName,
          lname: lName,
          password1: password,
          password2: password,
          username: fName.toLowerCase());
      ApiReturnModel? data = await apiRepo().callApi(
          tag: 'User Register',
          uri: AppUrl().login(),
          bodyData: BodyData.raw(body: regPayload.toJson()),
          method: Method.post,
          headers: {'Content-Type': 'application/json'});
      if (data?.responseString != null) {
        var resp = data?.responseString;
        /*return resp['successMessage'];*/
        return data;
      }
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
    return null;
  }

  Future<ApiReturnModel?> verifyOTPApiCall({
    required String email,
    required String otp
  }) async {
    try {
      VerifyOtpModel payload = VerifyOtpModel(
        email: email,otp: otp
      );
      ApiReturnModel? data = await apiRepo().callApi(
          tag: 'User Register',
          uri: AppUrl().verifyOTP(),
          bodyData: BodyData.raw(body: payload.toJson()),
          method: Method.post,
          headers: {'Content-Type': 'application/json'});
      if (data?.responseString != null) {
        return data;
      }
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
    return null;
  }
}
