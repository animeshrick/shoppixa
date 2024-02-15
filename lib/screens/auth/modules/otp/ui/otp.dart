import 'package:flutter/material.dart';

import '../../../../../utils/routes/navigation_context.dart';
import 'otp_verify.dart';

class OtpView {
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
