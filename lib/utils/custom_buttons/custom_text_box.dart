import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../custom_text.dart';

Widget customTextButton(
    {bool? isLoading = false,
    bool? isUnderLine = false,
    required String buttonText,
    required Function()? onPressed,
    double? height,
    double? width,
    required double buttonTextSize,
    Color? btnColor,
    Color? textColor,
    //Widget? prefixWidget,
    //Widget? suffixWidget,
    FontWeight? fontWeight}) {
  return SizedBox(
    width: width,
    height: height,
    child: isLoading == true
        ? const Center(child: CircularProgressIndicator())
        : TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(btnColor),
              padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            onPressed: onPressed,
            child: Center(
              child: isUnderLine == true
                  ? customUnderlineText(
                      buttonText, textColor ?? white, buttonTextSize)
                  : customText(buttonText, textColor ?? white, buttonTextSize,
                      fontWeight: fontWeight),
            ),
          ),
  );
}
