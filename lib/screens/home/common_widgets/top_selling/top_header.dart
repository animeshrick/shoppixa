import 'package:flutter/material.dart';

import '../../../../utils/constants/app_color.dart';
import '../../../../utils/custom_text.dart';

class TopHeader extends StatelessWidget {
  final String headerTitle;
  final Function()? headerOnTap;

  const TopHeader({super.key, required this.headerTitle, this.headerOnTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          customText(headerTitle, appBaseColor, 16,
              fontWeight: FontWeight.bold),
          CircleAvatar(
              backgroundColor: appBaseColor,
              radius: 15,
              child: IconButton(
                onPressed: headerOnTap,
                icon: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 12,
                  color: Colors.white,
                ),
              )),
        ],
      ),
    );
  }
}
