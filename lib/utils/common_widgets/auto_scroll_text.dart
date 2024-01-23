import 'package:flutter/material.dart';
import 'package:shoppixa/utils/custom_text.dart';
import 'package:text_scroll/text_scroll.dart';

class AutoScrollText extends StatelessWidget {
  const AutoScrollText({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      "Trending Cloths",
      "100% Geniune brands",
      "Latest Launchs",
      "Premium Quality"
    ];
    return Container(
        decoration: const BoxDecoration(
          color: Color(0xff1B6392),
        ),
        width: MediaQuery.sizeOf(context).width,
        child: TextScroll(
          "Trending Cloths ~ "
          "100% Genuine brands ~ "
          "Latest Launches ~ "
          "Premium Quality ~ ",
          mode: TextScrollMode.endless,
          style: customizeTextStyle(FontWeight.w400, 16, Colors.white),
        ));
  }
}
