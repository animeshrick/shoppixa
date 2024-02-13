import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_text.dart';

Widget customTextField(
    {String? labelText,
    String? hintText,
    String? Function(String?)? validator,
    TextEditingController? controller,
    bool? isPhoneField,
    bool? isNumField,
    Function(String)? onChanged,
    bool obscureText = false,
    bool? isLast,
    bool? isSearch,
    bool? isEnable = true,
    TextInputType? keyboardType,
    int? maxLength,
    int? minLines,
    int? maxLines,
    bool isAutoFocus = false,
    InputBorder? inputbroder,
    Widget? prefixWidget,
    bool isAlphaNumeric = false,
    bool isNeedDesign = false,
    Widget? prefixIcon,
    Widget? suffixIcon,
    FocusNode? focusNode,
    bool isDob = false,
    bool isPANField = false,
    AutovalidateMode? autovalidateMode}) {
  return TextFormField(
      textCapitalization: isAlphaNumeric == true
          ? TextCapitalization.characters
          : TextCapitalization.sentences,
      inputFormatters: isPANField == true
          ? [UpperCaseTextFormatter()]
          : isPhoneField == true
              ? [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                  FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.deny(' '),
                ]
              : isNumField == true
                  ? [
                      FilteringTextInputFormatter.deny(RegExp('[-_., ]')),
                      FilteringTextInputFormatter.deny(' '),
                    ]
                  : isAlphaNumeric == true
                      ? [
                          FilteringTextInputFormatter.allow(
                              RegExp("[0-9a-zA-Z]")),
                          FilteringTextInputFormatter.deny(' '),
                        ]
                      : isDob == true
                          ? [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(8),
                              DateTimeInputFormatter()
                            ]
                          : [
                              // FilteringTextInputFormatter.deny(' '),
                            ],
      maxLength: maxLength,
      minLines: minLines,
      maxLines: maxLines,
      autofocus: isAutoFocus,
      obscureText: obscureText,
      enabled: isEnable,
      decoration: isPhoneField == true
          ? InputDecoration(
              labelText: (labelText ?? ""),
              prefixText: '+91',
              prefixStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              counterText: "")
          : isSearch == true
              ? InputDecoration(
                  labelText: (labelText ?? ""),
                  hintText: (hintText ?? ""),
                  hintStyle:
                      customizeTextStyle(FontWeight.w300, 12.0, Colors.black),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 0.0),
                  ),
                  counterText: "")
              : isNeedDesign == true
                  ? InputDecoration(
                      errorMaxLines: 2,
                      focusColor: Colors.yellow,
                      label: customText(
                          labelText ?? "", const Color(0xffACBDD7), 16,
                          textAlign: TextAlign.left),
                      labelStyle: customizeTextStyle(
                          FontWeight.w300, 12.0, Colors.black),
                      hintText: (hintText ?? ""),
                      alignLabelWithHint: true,
                      prefixIcon: prefixIcon,
                      prefixIconColor: const Color(0xff50ABFF),
                      suffixIcon: suffixIcon,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Color(0xffCFD8E7)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Color(0xff50ABFF)),
                      ),
                    )
                  : InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: (labelText ?? ""),
                      hintText: (hintText ?? ""),
                      border: inputbroder,
                      prefix: prefixWidget,
                      prefixIcon: prefixIcon,
                      counterText: ""),
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      textInputAction:
          isLast == true ? TextInputAction.done : TextInputAction.next,
      keyboardType: keyboardType,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      focusNode: focusNode);
}

Widget customTextField2(
    {String? labelText,
    // String? initialValue,
    // String? Function(String?)? validator,
    Function(String)? onChanged,
    TextInputType? keyboardType,
    bool isAutoFocus = false,
    required TextEditingController controller,
    required List<TextInputFormatter> inputFormatters}) {
  return TextFormField(
    // initialValue: initialValue,
    decoration: InputDecoration(
      labelText: (labelText ?? ""),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 0.0),
      ),
    ),
    // validator: validator,
    onChanged: onChanged,
    textInputAction: TextInputAction.next,
    keyboardType: keyboardType,
    controller: controller,
    inputFormatters: inputFormatters,
  );
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class DateTimeInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 &&
          nonZeroIndex != newText.length &&
          buffer.length < 7) {
        buffer.write('-');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
