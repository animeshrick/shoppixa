import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppixa/resources/local_storeage/token_sp/token_sp.dart';
import 'package:shoppixa/screens/profile/componets/profile_menu.dart';
import 'package:shoppixa/screens/profile/componets/profile_pic.dart';
import 'package:shoppixa/utils/routes/navigation_context.dart';
import 'package:shoppixa/utils/routes/route_names.dart';

class UserProfile extends StatefulWidget {
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              icon: "assets/icons/User Icon.svg",
              press: () => {},
            ),
            ProfileMenu(
              text: "More",
              icon: "assets/icons/Bill Icon.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Notifications",
              icon: "assets/icons/Bell.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Settings",
              icon: "assets/icons/Settings.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Help Center",
              icon: "assets/icons/Question mark.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/Log out.svg",
              press: () async {
                await TokenSP().clearTokens().then((value) {
                  CurrentContext().context.goNamed(MyRoutes.home);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
