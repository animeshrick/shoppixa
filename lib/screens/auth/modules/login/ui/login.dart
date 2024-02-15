import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppixa/screens/auth/modules/login/bloc/login_bloc.dart';
import 'package:shoppixa/utils/constants/app_color.dart';
import 'package:shoppixa/utils/custom_buttons/cross_btn.dart';
import 'package:shoppixa/utils/extension/extended_sizedbox.dart';

import '../../../../../network/dynamic_data/dynamic_data.dart';
import '../../../../../utils/custom_buttons/custom_elevated_btn.dart';
import '../../../../../utils/custom_text_field.dart';
import '../../../../../utils/routes/route_names.dart';
import '../../../../../utils/validator/validator.dart';

class AppSignIn extends StatefulWidget {
  const AppSignIn({super.key});

  @override
  State<AppSignIn> createState() => _AppSignInState();
}

class _AppSignInState extends State<AppSignIn> {
  TextEditingController email = TextEditingController(text: "we@gmail.com");
  TextEditingController password = TextEditingController(text: "123456");
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => LoginBloc(),
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (loginContext, loginState) {
              return SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Container(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 35),
                  color: Colors.white70,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        const Align(
                            alignment: Alignment.topLeft, child: CrossBtn()),
                        Container(
                          width: 130,
                          height: 130,
                          alignment: Alignment.center,
                          child: const FlutterLogo(),
                        ),
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
                        const SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Forgot your password?",
                            style: TextStyle(
                              color: Color(0xFF666666),
                              fontStyle: FontStyle.normal,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        15.ph,
                        customButton(
                            btnColor: appBaseColor,
                            buttonText: "Sign In",
                            radius: 42,
                            width: double.infinity,
                            isLoading:
                                loginState.login.status == Status.loading,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                loginContext.read<LoginBloc>().add(LoginCall(
                                    email: email.text,
                                    password: password.text));
                              }
                            },
                            buttonTextSize: 14),
                        10.ph,
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                "Don't have an account? ",
                                style: TextStyle(
                                  color: Color(0xFF666666),
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              InkWell(
                                onTap: () => {
                                  kIsWeb
                                      ? context.goNamed(MyRoutes.register)
                                      : context.pushNamed(MyRoutes.register)
                                },
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Color(0xFFAC252B),
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
              );
            },
          ),
        ),
      ),
    );
  }
}
