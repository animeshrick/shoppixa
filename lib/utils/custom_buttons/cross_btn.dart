import 'package:flutter/material.dart';
import 'package:shoppixa/utils/routes/customRoute.dart';

import '../constants/app_color.dart';

class CrossBtn extends StatelessWidget {
  const CrossBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.black12,
      child: InkWell(
        child: const Icon(Icons.close, color: appBaseColor),
        onTap: () {
          CustomRoute().back();
        },
      ),
    );
  }
}
