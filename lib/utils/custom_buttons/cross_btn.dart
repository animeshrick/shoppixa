import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/app_color.dart';
import '../routes/route_names.dart';

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
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
