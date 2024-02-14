import 'package:flutter/material.dart';

import '../../../utils/routes/navigation_context.dart';
import 'otp_view/otp_verify.dart';

class OtpView {
/*  Future<String?> otpPicker(
      {bool? changePinCode, String? pinCodeVal, String? buttonText}) {
    return Navigator.of(CurrentContext().context).push(
      PageRouteBuilder(
          opaque: false,
          pageBuilder: (_, __, ___) => OtpPicker(
                changePinCode: changePinCode,
                pinCodeVal: pinCodeVal,
                customTitle: "Verify your OTP",
                buttonText: buttonText,
              )),
    );
  }*/

  Future<String?> otpPicker2({required String phNo}) {
    return showModalBottomSheet(
      context: CurrentContext().context,
      isScrollControlled: true,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return OtpVerify(emailID: phNo);
      },
    );
  }
}
