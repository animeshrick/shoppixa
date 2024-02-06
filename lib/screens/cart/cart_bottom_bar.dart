import 'package:flutter/material.dart';

import '../../utils/constants/app_color.dart';
import '../../utils/constants/app_english_text.dart';
import '../../utils/custom_text.dart';

class CartBottomBar extends StatelessWidget {
  const CartBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Total",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        Row(
          children: [
            customText("${AppEnglishText().rupee}5000", appBaseColor, 25,
                fontWeight: FontWeight.w900),
            IconButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.more_vert,
                  size: 14,
                )),
          ],
        ),
      ],
    );
  }
}
