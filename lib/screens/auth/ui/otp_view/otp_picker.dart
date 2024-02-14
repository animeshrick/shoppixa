// import 'package:flutter/material.dart';
// import 'package:shoppixa/utils/extension/extended_sizedbox.dart';
//
// import '../../../../utils/constants/app_color.dart';
// import '../../../../utils/custom_text.dart';
// import '../../../../utils/custom_text_field.dart';
// import '../../../../utils/validator/validator.dart';
//
// class OtpPicker extends StatelessWidget {
//   OtpPicker(
//       {super.key,
//       this.pinCodeVal,
//       this.changePinCode,
//       this.customTitle,
//       this.buttonText});
//
//   /// Title
//   ///
//   ///
//   String? customTitle;
//
//   /// Button Text
//   ///
//   ///
//   String? buttonText;
//
//   /// Initial Pin code Value
//   ///
//   ///
//   String? pinCodeVal;
//
//   /// Change Pin code in local storage.
//   ///
//   ///
//   bool? changePinCode;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black26,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               color: white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(42.0),
//                 topRight: Radius.circular(42.0),
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.blue,
//                   blurRadius: 7,
//                   spreadRadius: 3,
//                 )
//               ],
//             ),
//             // height: MediaQuery.of(context).size.height * 0.5,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: Container(
//                         height: 40,
//                         width: 75,
//                         decoration: const BoxDecoration(
//                             color: Colors.red,
//                             borderRadius: BorderRadius.only(
//                               topRight: Radius.circular(42.0),
//                               bottomLeft: Radius.circular(42.0),
//                             )),
//                         child: const Icon(
//                           Icons.close,
//                           color: white,
//                           size: 13,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: Row(
//                     children: [
//                       customText("customTitle", black, 19,
//                           fontWeight: FontWeight.w600),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: customTextField(
//                       keyboardType: TextInputType.number,
//                       maxLength: 6,
//                       validator: (v) {
//                         return Validator().pinCodeValidator(value: v);
//                       },
//                       controller: null,
//                       inputbroder: OutlineInputBorder(
//                         borderSide:
//                             const BorderSide(color: Colors.grey, width: 2),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       hintText: "OTP",
//                       suffixIcon: const Icon(
//                         Icons.location_on_outlined,
//                         size: 30,
//                       )),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 ElevatedButton(
//                   onPressed: null,
//                   /* onPressed: !(pinCodePicker.isLoading)
//                                 ? () {
//                               if (pinCodePicker.formKey.currentState
//                                   ?.validate() ==
//                                   true) {
//                                 pinCodePicker.pinCodeViewModel(
//                                     pinCode:
//                                     pinCodePicker.pinCodeController.text);
//                               }
//                             }
//                                 : null,*/
//                   child: customOnlyText(
//                     "Proceed",
//                     style: customizeTextStyle(FontWeight.w600, 15, white),
//                   ),
//                 ),
//                 20.ph,
//                 InkWell(
//                   onTap: () {
//                     // pinCodePicker?.useCurrentLocation();
//                   },
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Icon(Icons.location_on_outlined),
//                       const SizedBox(
//                         width: 20,
//                       ),
//                       customText("Resend OTP", black, 17,
//                           fontWeight: FontWeight.w600),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
