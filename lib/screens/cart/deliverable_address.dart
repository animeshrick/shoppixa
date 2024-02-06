import 'package:flutter/material.dart';
import 'package:shoppixa/utils/constants/app_color.dart';
import 'package:shoppixa/utils/custom_buttons/custom_out_line_btn.dart';
import 'package:shoppixa/utils/custom_buttons/custom_text_box.dart';
import 'package:shoppixa/utils/custom_text.dart';

class DeliverableAddress extends StatelessWidget {
  const DeliverableAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      // height: 70,
      elevation: 5,
      // width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    customText("Deliver to - ", Colors.black, 16),
                    SizedBox(width: 5),
                    SizedBox(
                      width: 150,
                      child: customOverflowText(
                          "Animesh Banerjee", Colors.black, 16,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.start),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.68,
                  child: customOverflowText(
                      "Robert Robertson, 1234 NW Bobcat Lane, St. Robert, MO 65584-5678",
                      Colors.black,
                      16,
                      fontWeight: FontWeight.normal,
                      maxLines: 1,
                      textAlign: TextAlign.start),
                ),
              ],
            ),
            customTextButton(
              buttonText: 'Change',
              onPressed: () {},
              buttonTextSize: 14,
              btnColor: appBaseColor,
            ),
          ],
        ),
      ),
    );
  }
}
