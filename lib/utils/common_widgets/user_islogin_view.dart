import 'package:flutter/material.dart';
import 'package:shoppixa/utils/constants/app_color.dart';
import 'package:shoppixa/utils/custom_buttons/custom_out_line_btn.dart';
import 'package:shoppixa/utils/custom_image_view/custom_image_view.dart';
import 'package:shoppixa/utils/custom_text.dart';
import 'package:shoppixa/utils/extension/extended_sizedbox.dart';

class IsUserLoginView extends StatelessWidget {
  final String pageName;
  final Function()? OntapLogin;

  const IsUserLoginView(
      {super.key, required this.pageName, required this.OntapLogin});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        children: [
          CustomImageView(
              height: 500,
              width: 500,
              url:
                  'https://img.freepik.com/free-vector/login-concept-illustration_114360-757.jpg?w=740&t=st=1706867074~exp=1706867674~hmac=23cd7b271915b0e8f9f9788489124ee44d16595eb8d900c11bd86c3462e3824f'),
          Center(
            child: customText(
                'Please login to view $pageName', Colors.blueGrey, 16,
                fontWeight: FontWeight.normal),
          ),
          15.ph,
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.4,
            height: 42,
            child: customOutlineButton(
                borderColor: appBaseColor,
                onTap: OntapLogin,
                content: Center(child: customOnlyText("Login"))),
          ),
        ],
      ),
    );
  }
}
