import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoppixa/utils/date_utils.dart';

import '../custom_text.dart';

Widget customDateTimeButton(
    {DateTime? issueDate,
    required String title,
    double? width,
    required void Function()? onPressed}) {
  return InkWell(
    borderRadius: const BorderRadius.all(Radius.circular(5)),
    splashColor: Colors.blue,
    onTap: onPressed,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      height: 45,
      width: width ?? 120,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Row(
        children: [
          customText(
              issueDate == null
                  ? title
                  : DateTimeUtils().removeTimeFromDataTime(date: issueDate),
              Colors.black,
              14),
          const Spacer(),
          SvgPicture.asset(
            "assets/logo/calender.svg",
            height: 20,
            width: 20,
            colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
          ),
        ],
      ),
    ),
  );
}
