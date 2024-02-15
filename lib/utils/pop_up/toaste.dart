import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoppixa/utils/extension/extended_sizedbox.dart';

import '../constants/app_color.dart';
import '../custom_text.dart';

class ToastMassage extends StatelessWidget {
  ToastMassage({super.key, required this.message, required this.color});

  String message;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 20,
        shadowColor: Colors.grey,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 60,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: SvgPicture.asset('assets/icons/Error.svg')),
              10.pw,
              SizedBox(
                width: 200,
                child: customOverflowText(message, white, 13,
                    textAlign: TextAlign.center),
              ),
            ],
          ),
        ));
  }
}
