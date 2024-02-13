import 'package:intl/intl.dart';

import '../constants/app_english_text.dart';

class Validator {
  String? textValidatorAlphanumericWithSpacialCharacters(
      {String? value, required String msg}) {
    String p = r'^[ A-Za-z0-9-,\.(@/-_)&]*$';
    RegExp regExp = RegExp(p);
    bool validate = regExp.hasMatch(value ?? "");
    // return regExp.hasMatch(em);

    if (value == null || value.isEmpty) {
      return "$msg ${AppEnglishText().cannot_be_blank}";
    } else if (value[0] == " ") {
      return "$msg ${AppEnglishText().cannot_be_blank}";
    } else if (value.length < 3) {
      return "$msg ${AppEnglishText().length_grater_than}";
    } else if (!validate) {
      return "${AppEnglishText().enter_valid_msg} $msg .";
    } else {
      return null;
    }
  }

  String? ifscCodeValidation({String? value, required String msg}) {
    RegExp regExp = RegExp(r'^[A-Z]{4}0[A-Z0-9]{6}$');
    bool validate = regExp.hasMatch(value ?? "");
    if (value == null || value.isEmpty) {
      return "$msg ${AppEnglishText().cannot_be_blank}";
    } else if (value[0] == " ") {
      return "$msg ${AppEnglishText().cannot_be_blank}";
    } else if (value.length < 3) {
      return "$msg ${AppEnglishText().length_grater_than}";
    } else if (!validate) {
      return "${AppEnglishText().enter_valid_msg} $msg .";
    } else {
      return null;
    }
  }

  String? textValidatorAlphanumeric({String? value, required String msg}) {
    String p = r'^[ A-Za-z0-9]*$';
    RegExp regExp = RegExp(p);
    bool validate = regExp.hasMatch(value ?? "");
    // return regExp.hasMatch(em);

    if (value == null || value.isEmpty) {
      return "$msg ${AppEnglishText().cannot_be_blank}";
    } else if (value[0] == " ") {
      return "$msg ${AppEnglishText().cannot_be_blank}";
    } else if (value.length < 3) {
      return "$msg ${AppEnglishText().length_grater_than}";
    } else if (!validate) {
      return "${AppEnglishText().enter_valid_msg} $msg .";
    } else {
      return null;
    }
  }

  String? onlyTextValidator({String? value, required String msg}) {
    String p = r'^[ A-Za-z]*$';
    RegExp regExp = RegExp(p);
    bool validate = regExp.hasMatch(value ?? "");
    // return regExp.hasMatch(em);

    if (value == null || value.isEmpty) {
      return "$msg ${AppEnglishText().cannot_be_blank}";
    } else if (value[0] == " ") {
      return "$msg ${AppEnglishText().cannot_be_blank}";
    } else if (value.length < 3) {
      return "$msg ${AppEnglishText().length_grater_than}";
    } else if (!validate) {
      return "${AppEnglishText().enter_valid_msg} $msg .";
    } else {
      return null;
    }
  }

  String? longTextValidator({String? value, required String msg}) {
    String p = r'^[ A-Za-z]*$';
    RegExp regExp = RegExp(p);
    bool validate = regExp.hasMatch(value ?? "");
    // return regExp.hasMatch(em);

    if (value == null || value.isEmpty) {
      return "$msg ${AppEnglishText().cannot_be_blank}";
    } else if (value[0] == " ") {
      return "$msg ${AppEnglishText().cannot_be_blank}";
    } else if (value.length < 20) {
      return "$msg ${AppEnglishText().longText}";
    } else if (!validate) {
      return "${AppEnglishText().enter_valid_msg} $msg .";
    } else {
      return null;
    }
  }

  String? pinCodeValidator({String? value}) {
    String p = r'^[1-9][0-9]{5}$';
    RegExp regExp = RegExp(p);

    bool validate = regExp.hasMatch(value ?? "");
    // return regExp.hasMatch(em);

    if (value == null || value.isEmpty) {
      return "${AppEnglishText().pinCode} ${AppEnglishText().cannot_be_blank}";
    } else if (value[0] == " ") {
      return "${AppEnglishText().pinCode} ${AppEnglishText().cannot_be_blank}";
    } else if (value.length != 6 || !validate) {
      return "${AppEnglishText().enter_valid_msg} ${AppEnglishText().pinCode} .";
    } else {
      return null;
    }
  }

  String? dobValidator({String? value}) {
    if (value == null || value.isEmpty) {
      return AppEnglishText().dateTimeValidator2;
    } else if (value.length < 10) {
      return AppEnglishText().dateTimeValidator;
    } else if (value.length == 10) {
      var date = DateTime.parse(
          "${value.trim().split("-").elementAt(2)}-${value.trim().split("-").elementAt(1)}-${value.trim().split("-").elementAt(0)}");
      if (DateFormat("dd-MM-yyyy").format(date) != value ||
          date.difference(DateTime.now()).inDays > 0) {
        return AppEnglishText().dateTimeValidator;
      }
    }

    return null;
  }

  String? emailValidator({String? value}) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    bool validate = regExp.hasMatch(value ?? "");
    if (!validate) {
      return AppEnglishText().emailValidator;
    } else if (value![0] == " ") {
      return AppEnglishText().emailValidator;
    } else {
      return null;
    }
  }

/*  String? phoneNumberValidator({String? value}) {
    String p = r'^[0-9]*$';
    RegExp regExp = RegExp(p);
    bool validate = regExp.hasMatch(value ?? "");
    List<String> digits = ["1", '2', '3', '4'];
    // return regExp.hasMatch(em);

    if (value == null || value.isEmpty) {
      return tr(LocalizationKeys.phoneValidationText);
    } else if (value[0] == " ") {
      return tr(LocalizationKeys.phoneValidationText);
    } else if (digits.contains(value[0])) {
      return tr(LocalizationKeys.phoneValidationText);
    } else if (value.length != 10 || !validate) {
      return tr(LocalizationKeys.phoneValidationText);
    } else {
      return null;
    }
  }*/

  String? validatePassword(String? password) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');
    bool validate = regex.hasMatch(password ?? "");

    if (password == null || password.isEmpty) {
      return 'Please enter password';
    } else {
      if (!validate && password.contains(" ")) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }

  String? validateEmptyField({String? value, required String msg}) {
    if (value == null || value.isEmpty) {
      return "$msg ${AppEnglishText().cannot_be_blank}";
    } else if (value[0] == " ") {
      return "$msg ${AppEnglishText().cannot_be_blank}";
    } else if (value.length < 3) {
      return "$msg ${AppEnglishText().length_grater_than}";
    } else {
      return null;
    }
  }
}
