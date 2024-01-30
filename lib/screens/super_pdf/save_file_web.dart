///Dart imports
import 'dart:async';
import 'dart:convert';

import 'package:universal_html/html.dart';
// ignore: avoid_web_libraries_in_flutter
// import 'dart:html';

// ignore: avoid_classes_with_only_static_members
///To save the pdf file in the device
class SaveFileWeb {
  ///To save the pdf file in the device
  static Future<void> saveAndLaunchFileWeb(
      List<int> bytes, String fileName) async {
    AnchorElement(
        href:
        'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
      ..setAttribute('download', fileName)
      ..click();
  }
}