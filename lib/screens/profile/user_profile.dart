import 'package:flutter/material.dart';
import 'package:shoppixa/utils/common_widgets/user_islogin_view.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          IsUserLoginView(pageName: "Profile", OntapLogin: () {}),
        ],
      ),
    );
  }
}
