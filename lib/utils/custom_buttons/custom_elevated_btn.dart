import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../custom_text.dart';

Widget customButton({
  bool? isLoading = false,
  required String buttonText,
  required Function()? onPressed,
  double? height,
  double? width,
  required double buttonTextSize,
  Color? btnColor,
  Color? textColor,
  dynamic fontWeight,
  double? radius,
}) {
  return SizedBox(
    width: width,
    height: height,
    child: isLoading == true
        ? const Center(child: CircularProgressIndicator())
        : ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(btnColor),
              padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius ?? 5),
                ),
              ),
            ),
            onPressed: onPressed,
            child: customText(buttonText, textColor ?? white, buttonTextSize,
                fontWeight: fontWeight),
          ),
  );
}
