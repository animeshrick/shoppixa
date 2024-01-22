import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextUtils {
  bool isNonZeroNumericValue(String txt) {
    if (isTextNotEmptyOrNull(txt)) {
      try {
        return double.parse(txt) > 0;
      } catch (e) {
        return false;
      }
    }
    return false;
  }

  bool isTextNotEmptyOrNull(dynamic src) {
    var value = src != null &&
        src.toString().isNotEmpty &&
        src != "null" &&
        src != "Null" &&
        src != "";
    return value;
  }

  String setNullTextToBlank(final String input) {
    return !isTextNotEmptyOrNull(input) ? "" : input;
  }

  String toTitleCase(String str) {
    if (str.isEmpty) {
      return str;
    }
    return str.substring(0, 1).toUpperCase() + str.substring(1);
  }

  String base64Encode({required String string}) {
    if (string == "null") return '';
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(string);
    return encoded;
  }

  String base64Decode({required String string}) {
    if (string == "null") return '';
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String decoded = stringToBase64.decode(string);
    return decoded;
  }

  /* Future<void> launchingUrl(String url) async {
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.inAppWebView,
      );
    } else {
      PopUpItems().toastMessage('Could not launch $url', red);
    }
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }*/

  void showAllDatePicker(
    BuildContext context, {
    required void Function(DateTime) onDateTimeChanged,
  }) {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height * 0.25,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: onDateTimeChanged,
              initialDateTime: DateTime.now(),
              minimumYear: 1900,
              maximumYear: DateTime.now().year + 20,
            ),
          );
        });
  }

  mapToJson(dynamic obj) {
    try {
      if (obj != null) {
        return json.encode(obj);
      }
    } catch (e) {
      throw e.toString();
    }
  }

  jsonToMap(dynamic json) {
    try {
      if (json != null) {
        return json.decode(json);
      }
    } catch (e) {
      throw e.toString();
    }
  }

  fromJsonToKeyValuePair(dynamic stringJson) {
    try {
      if (stringJson != null) {
        return stringJson.then(
          (onValue) {
            if (onValue != null) {
              onValue.data.forEach((k, v) {
                //AppLog().log('$k,$v');
              });
            }
          },
        );
      }
    } catch (e) {
      throw e.toString();
    }
  }

  formatDouble(dynamic value) {
    try {
      return value == null ? 0.0 : double.parse(value.toString());
    } catch (e) {
      throw e.toString();
    }
  }
}
