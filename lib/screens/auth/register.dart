import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppixa/utils/custom_buttons/cross_btn.dart';
import 'package:shoppixa/utils/constants/app_color.dart';
import 'package:shoppixa/utils/custom_buttons/custom_elevated_btn.dart';
import 'package:shoppixa/utils/custom_text_field.dart';
import 'package:shoppixa/utils/extension/extended_sizedbox.dart';

import '../../utils/routes/route_names.dart';

class AppSingUp extends StatelessWidget {
  const AppSingUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Container(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 35),
            color: Colors.white70,
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: CrossBtn(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 130,
                      height: 130,
                      alignment: Alignment.center,
                      child: const FlutterLogo(),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                            flex: 1,
                            child: customTextField(
                              isNeedDesign: true,
                              isAutoFocus: true,
                              controller: null,
                              hintText: "First Name",
                              labelText: "First Name",
                            )),
                        10.pw,
                        Flexible(
                            flex: 1,
                            child: customTextField(
                                isNeedDesign: true,
                                controller: null,
                                hintText: "Last Name",
                                labelText: "Last Name")),
                      ],
                    ),
                    15.ph,
                    customTextField(
                      isNeedDesign: true,
                      controller: null,
                      prefixIcon:
                          const Icon(Icons.phone_outlined, color: appBaseColor),
                      hintText: "Phone Number",
                      labelText: "Phone Number",
                      keyboardType: TextInputType.phone,
                    ),
                    15.ph,
                    customTextField(
                      isNeedDesign: true,
                      controller: null,
                      hintText: "Email ID",
                      labelText: "Email ID",
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.alternate_email,
                          color: appBaseColor),
                    ),
                    15.ph,
                    customTextField(
                      isNeedDesign: true,
                      controller: null,
                      hintText: "Password",
                      labelText: "Password",
                      obscureText: true,
                      maxLines: 1,
                      prefixIcon:
                          const Icon(Icons.password_sharp, color: appBaseColor),
                    ),
                    15.ph,
                    customTextField(
                      isNeedDesign: true,
                      controller: null,
                      hintText: "Confirm Password",
                      labelText: "Confirm Password",
                      obscureText: true,
                      maxLines: 1,
                      isLast: true,
                      prefixIcon:
                          const Icon(Icons.password_sharp, color: appBaseColor),
                    ),
                    15.ph,
                    customButton(
                        width: double.infinity,
                        height: 42,
                        radius: 42,
                        btnColor: appBaseColor,
                        buttonText: "Sign Up",
                        onPressed: () {},
                        buttonTextSize: 14),
                    10.ph,
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(
                          color: Color(0xFF666666),
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          kIsWeb
                              ? context.goNamed(MyRoutes.login)
                              : context.pushNamed(MyRoutes.login);
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
