import 'package:flutter/material.dart';

import '../../screens/auth/login.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget({super.key, required super.child, required super.preferredSize});

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      centerTitle: true,
      title: Image.asset(
        "assets/images/ic_app_icon.png",
        width: 80,
        height: 40,
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AppSignIn()),
            );
          },
          icon: const Icon(Icons.account_circle),
          color: const Color(0xFF323232),
        ),
      ],
    ); // Your custom widget implementation.
  }
}
