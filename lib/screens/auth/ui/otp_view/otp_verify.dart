import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shoppixa/utils/constants/app_color.dart';
import 'package:shoppixa/utils/extension/extended_sizedbox.dart';

import '../../../../utils/custom_buttons/custom_elevated_btn.dart';
import '../../../../utils/custom_text.dart';
import '../../../../utils/pop_up/pop_over.dart';

class OtpVerify extends StatefulWidget {
  final String emailID;

  const OtpVerify({super.key, required this.emailID});

  @override
  State<OtpVerify> createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  final formKey = GlobalKey<FormState>();
  StreamController<ErrorAnimationType>? errorController;
  TextEditingController textEditingController = TextEditingController();
  late Timer _timer;
  int _start = 30;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Popover(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: customOnlyText(
                'Verify OTP',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: appBaseColor),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
              child: RichText(
                text: TextSpan(
                    text: "Enter verification code sent to \n",
                    children: [
                      TextSpan(
                          text: widget.emailID,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 14)),
                    ],
                    style:
                        const TextStyle(color: Colors.black54, fontSize: 18)),
                textAlign: TextAlign.center,
              ),
            ),
            20.ph,
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
              child: PinCodeTextField(
                appContext: context,
                length: 6,
                blinkWhenObscuring: true,
                animationType: AnimationType.fade,
                cursorColor: Colors.black,
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: false,
                errorAnimationController: errorController,
                controller: textEditingController,
                keyboardType: TextInputType.number,
                onChanged: (val) {},
              ),
            ),
            20.ph,
            _start == 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customOnlyText(
                        "Didn't receive the code? ",
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 15),
                      ),
                      TextButton(
                        onPressed: () async {
                          /*final myRepo = AuthRepository();
                          await myRepo
                              .generateOtpApiCall(
                            phoneNo: widget.phNumber.toString(),
                          )
                              .whenComplete(() {
                            _start = 30;
                            setState(() {});
                            startTimer();
                          });*/
                        },
                        child: customOnlyText(
                          "RESEND",
                          style: const TextStyle(
                              color: Color(0xFF91D3B3),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )
                    ],
                  )
                : customText("0:$_start", appBaseColor, 18,
                    fontWeight: FontWeight.bold),
            14.ph,
            customButton(
              width: double.infinity,
              height: 55,
              btnColor: appBaseColor,
              radius: 25,
              // isLoading: authViewModel.checkOtpLoading,
              onPressed: () async {
                // final _myRepo = AuthRepository();
                /*if (textEditingController.text.length < 5) {
                  PopUpItems().popUpAlertNoTitle(
                      context: context,
                      onPressedOk: () {
                        kIsWeb ? context.pop() : Navigator.pop(context);
                      },
                      content: 'OTP is not correct');
                } else if (RSTextUtils()
                    .isTextNotEmptyOrNull(widget.businessName.toString())) {
                  await authViewModel.checkOtpViewModel(
                    otp: textEditingController.text.toString(),
                    phNo: widget.phNumber.toString(),
                    wpConsent: widget.wpConsentValue,
                    shopName: widget.businessName.toString(),
                    pinCode: widget.pinCode,
                    bbid: widget.bbId,
                  );
                } else {
                  await authViewModel.checkOtpViewModel(
                      otp: textEditingController.text.toString(),
                      phNo: widget.phNumber.toString(),
                      wpConsent: widget.wpConsentValue);
                }*/
              },
              buttonText: "Verify",
              buttonTextSize: 15,
            ),
            15.ph,
          ],
        ),
      ),
    );
  }
}
