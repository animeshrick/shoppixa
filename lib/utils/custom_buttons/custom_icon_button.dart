import 'package:flutter/material.dart';
import 'package:shoppixa/utils/text_utils.dart';

import '../custom_text.dart';

Widget customIconButton({
  String badgeContent = '',
  Color? iconColor,
  required Function()? onPressed,
  required IconData? icon,
}) {
  return IconButton(
    onPressed: onPressed,
    splashRadius: 20,
    icon: Badge(
        isLabelVisible:
            TextUtils().isTextNotEmptyOrNull(badgeContent) ? true : false,
        label: customOnlyText(badgeContent.length >= 2 ? "9+" : badgeContent,
            style: const TextStyle(color: Colors.white, fontSize: 10)),
        child: Icon(icon, size: 20, color: iconColor)),
  );
}
