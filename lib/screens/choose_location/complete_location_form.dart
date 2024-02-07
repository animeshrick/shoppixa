import 'package:flutter/material.dart';
import 'package:shoppixa/screens/choose_location/vm/location_vm.dart';
import 'package:shoppixa/utils/constants/app_color.dart';
import 'package:shoppixa/utils/custom_buttons/custom_elevated_btn.dart';
import 'package:shoppixa/utils/custom_text.dart';
import 'package:shoppixa/utils/custom_text_field.dart';

completeLocationForm(BuildContext context,
    {required LocationVm locationVmValue}) {
  showModalBottomSheet<void>(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Form(
        key: locationVmValue.formKey,
        child: Padding(
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
                          customText("Complete your current location",
                              Colors.black, 16,
                              fontWeight: FontWeight.bold),
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.black12,
                            child: IconButton(
                                padding: EdgeInsets.zero,
                                iconSize: 15,
                                onPressed: () {
                                  locationVmValue.clearFormOut(context);
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.red,
                                )),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  customTextField(
                      isAutoFocus: true,
                      isNeedDesign: true,
                      controller: locationVmValue.add1,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This is required (*)';
                        }
                        return null;
                      },
                      labelText: "Address Line1 *"),
                  SizedBox(
                    height: 10,
                  ),
                  customTextField(
                      controller: locationVmValue.add2,
                      isNeedDesign: true,
                      labelText: "Address Line2 (Optional)"),
                  SizedBox(
                    height: 10,
                  ),
                  customTextField(
                      controller: locationVmValue.landmark,
                      isNeedDesign: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This is required (*)';
                        }
                        return null;
                      },
                      labelText: "Landmark*"),
                  SizedBox(
                    height: 10,
                  ),
                  customTextField(
                      controller: locationVmValue.pincode,
                      isNeedDesign: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This is required (*)';
                        }
                        return null;
                      },
                      labelText: "Pincode*"),
                  SizedBox(
                    height: 10,
                  ),
                  customButton(
                      width: MediaQuery.sizeOf(context).width,
                      btnColor: appBaseColor,
                      buttonText: "Proceed",
                      onPressed: () {
                        locationVmValue.validateFullForm(context);
                      },
                      buttonTextSize: 14),
                ],
              ),
            )),
      );
    },
  );
}
