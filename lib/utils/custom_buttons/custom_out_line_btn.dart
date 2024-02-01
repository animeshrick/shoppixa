import 'package:flutter/material.dart';
import 'package:shoppixa/utils/constants/app_color.dart';

import '../custom_text.dart';

Widget customOutlineButton(
    {void Function()? onTap,
    Widget? content,
    Color borderColor = Colors.blue}) {
  return InkWell(
    onTap: onTap,
    borderRadius: const BorderRadius.all(Radius.circular(5)),
    splashColor: Colors.blue,
    hoverColor: Colors.grey,
    child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        decoration: BoxDecoration(
            border: Border.all(
              color: borderColor,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: content),
  );
}

Widget CustomOutLineBtn(
    {required Function()? onPressed,
    required String btnText,
    Color? borderColor,
    required double btnSize,
    required double btnHeight}) {
  return SizedBox(
    width: btnSize,
    height: btnHeight,
    child: OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: borderColor ?? appBaseColor),
      ),
      child: customText(btnText, Colors.red, 14),
    ),
  );
}
