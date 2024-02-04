import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppixa/resources/local_storeage/save_pincode/saved_pincode_sp.dart';
import 'package:shoppixa/utils/constants/app_color.dart';
import 'package:shoppixa/utils/custom_buttons/custom_elevated_btn.dart';
import 'package:shoppixa/utils/custom_text.dart';
import 'package:shoppixa/utils/custom_text_field.dart';
import 'package:shoppixa/utils/routes/route_names.dart';

completeLocationForm(BuildContext context) {
  showModalBottomSheet<void>(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customText(
                            "Complete your current location", Colors.black, 16,
                            fontWeight: FontWeight.bold),
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.black12,
                          child: IconButton(
                              padding: EdgeInsets.zero,
                              iconSize: 15,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.close,
                                color: Colors.red,
                              )),
                        ),
                      ]),
                ),
                customTextField(
                    isAutoFocus: true,
                    isNeedDesign: true,
                    labelText: "Address Line1 *"),
                customTextField(
                    isNeedDesign: true, labelText: "Address Line2 (Optional)"),
                customTextField(isNeedDesign: true, labelText: "Landmark*"),
                customTextField(isNeedDesign: true, labelText: "Pincode*"),
                customButton(
                    width: MediaQuery.sizeOf(context).width,
                    btnColor: appBaseColor,
                    buttonText: "Proceed",
                    onPressed: () {
                      SavedPinCodeSp().savePinCode('700105');
                      context.pushReplacementNamed(MyRoutes.home);
                    },
                    buttonTextSize: 14),
              ],
            ),
          ));
    },
  );
}
