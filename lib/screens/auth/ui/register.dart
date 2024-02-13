import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppixa/network/dynamic_data/dynamic_data.dart';
import 'package:shoppixa/screens/auth/bloc/auth_bloc.dart';
import 'package:shoppixa/utils/constants/app_color.dart';
import 'package:shoppixa/utils/custom_buttons/cross_btn.dart';
import 'package:shoppixa/utils/custom_buttons/custom_elevated_btn.dart';
import 'package:shoppixa/utils/custom_text.dart';
import 'package:shoppixa/utils/custom_text_field.dart';
import 'package:shoppixa/utils/extension/extended_sizedbox.dart';
import 'package:shoppixa/utils/validator/validator.dart';

import '../../../utils/pop_up/popup_items.dart';
import '../../../utils/routes/route_names.dart';

class AppSingUp extends StatefulWidget {
  const AppSingUp({super.key});

  @override
  State<AppSingUp> createState() => _AppSingUpState();
}

class _AppSingUpState extends State<AppSingUp> {
  TextEditingController email = TextEditingController(text: "@gmail.com");
  TextEditingController fName = TextEditingController(text: "Animesh");
  TextEditingController lName = TextEditingController(text: "Flutter");
  TextEditingController password = TextEditingController(text: "123456");
  TextEditingController confPassword = TextEditingController(text: "123456");
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (authContext, authState) {
          return SafeArea(
            child: Scaffold(
              body: Form(
                key: formKey,
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 35),
                    color: Colors.white70,
                    child: Column(
                      children: <Widget>[
                        const Align(
                            alignment: Alignment.topLeft, child: CrossBtn()),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 130,
                              height: 130,
                              alignment: Alignment.center,
                              child: const FlutterLogo(),
                            ),
                            15.ph,
                            customText(authState.register.message ?? "",
                                Colors.red, 14),
                            15.ph,
                            Row(
                              children: <Widget>[
                                Flexible(
                                    flex: 1,
                                    child: customTextField(
                                        isNeedDesign: true,
                                        isAutoFocus: true,
                                        /* isEnable: authState.isRegister.status ==
                                                Status.loading
                                            ? false
                                            : true,*/
                                        controller: fName,
                                        hintText: "First Name",
                                        labelText: "First Name",
                                        validator: (val) {
                                          return Validator().validateEmptyField(
                                              msg: 'First Name', value: val);
                                        })),
                                10.pw,
                                Flexible(
                                    flex: 1,
                                    child: customTextField(
                                        isNeedDesign: true,
                                        controller: lName,
                                        hintText: "Last Name",
                                        labelText: "Last Name",
                                        validator: (val) {
                                          return Validator().validateEmptyField(
                                              msg: 'Last Name', value: val);
                                        })),
                              ],
                            ),
                            15.ph,
                            customTextField(
                                isNeedDesign: true,
                                controller: email,
                                hintText: "Email ID",
                                labelText: "Email ID",
                                keyboardType: TextInputType.emailAddress,
                                prefixIcon: const Icon(Icons.alternate_email,
                                    color: appBaseColor),
                                validator: (val) {
                                  return Validator().emailValidator(value: val);
                                }),
                            15.ph,
                            customTextField(
                                isNeedDesign: true,
                                controller: password,
                                hintText: "Password",
                                labelText: "Password",
                                obscureText: true,
                                maxLines: 1,
                                prefixIcon: const Icon(Icons.password_sharp,
                                    color: appBaseColor),
                                suffixIcon: InkWell(
                                  onTap: () {},
                                  child: Icon(Icons.visibility_off),
                                ),
                                validator: (val) {
                                  return Validator().validatePassword(val);
                                }),
                            15.ph,
                            customTextField(
                                isNeedDesign: true,
                                controller: confPassword,
                                hintText: "Confirm Password",
                                labelText: "Confirm Password",
                                obscureText: true,
                                maxLines: 1,
                                isLast: true,
                                prefixIcon: const Icon(Icons.password_sharp,
                                    color: appBaseColor),
                                suffixIcon: InkWell(
                                  onTap: () {},
                                  child: Icon(Icons.visibility_off),
                                ),
                                validator: (val) {
                                  return Validator().validatePassword(val);
                                }),
                            15.ph,
                            customButton(
                                width: double.infinity,
                                isLoading:
                                    authState.register.status == Status.loading,
                                height: 42,
                                radius: 42,
                                btnColor: appBaseColor,
                                buttonText: "Sign Up",
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    if (password.text != confPassword.text) {
                                      PopUpItems().toastMessage(
                                          "Passwords doesn't match",
                                          Colors.red);
                                    } else {
                                      authContext.read<AuthBloc>().add(
                                          RegisterCall(
                                              fName: fName.text,
                                              lName: lName.text,
                                              email: email.text,
                                              password: password.text));
                                    }
                                  }
                                },
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
            ),
          );
        },
      ),
    );
  }
}
