import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle customizeTextStyle(
    FontWeight? fontWeight, double fontSize, Color fontColor,
    {TextDecoration? decoration,
    Color? decorationColor,
    double? height,
    Color? backgroundColor}) {
  return GoogleFonts.sourceSans3(
      decoration: decoration,
      fontWeight: fontWeight,
      wordSpacing: 3,
      color: fontColor,
      fontSize: fontSize,
      decorationColor: decorationColor,
      height: height,
      backgroundColor: backgroundColor);
}

Widget customText(
  String text,
  Color color,
  double size, {
  FontWeight? fontWeight,
  int? maxLines,
  bool? lineThrough,
  bool lineGapNeeded = false,
  TextAlign? textAlign,
  Color? backGroundColor,
}) {
  return Text(
    text,
    maxLines: maxLines,
    textAlign: textAlign,
    style: customizeTextStyle(
      fontWeight,
      size,
      color,
      height: lineGapNeeded == true
          ? 1.8
          : kIsWeb
              ? 1.2
              : 0.0,
      decoration: lineThrough == true
          ? TextDecoration.lineThrough
          : TextDecoration.none,
      decorationColor: Colors.grey,
      backgroundColor: backGroundColor,
    ),
  );
}

Widget customInkWellText(
  Function() onTap,
  String text,
  Color color,
  double size, {
  fontWeight,
  Key? key,
}) {
  return InkWell(
    key: key,
    onTap: onTap,
    child: Text(text, style: customizeTextStyle(fontWeight, size, color)),
  );
}

Widget customRichText(String text1, String text2, Color color1, Color color2) {
  return RichText(
    text: TextSpan(
      children: <TextSpan>[
        TextSpan(
            text: text1,
            style: customizeTextStyle(FontWeight.normal, 30, color1)),
        TextSpan(
            text: text2,
            style: customizeTextStyle(FontWeight.normal, 30, color2)),
      ],
    ),
    textScaleFactor: 0.5,
  );
}

Widget customUnderlineText(String text, Color color, double size,
    {fontWeight, decorationColor, TextAlign? textAlign}) {
  return Text(text,
      textAlign: textAlign,
      style: customizeTextStyle(
        fontWeight,
        size,
        color,
        decoration: TextDecoration.underline,
        decorationColor: decorationColor,
      ));
}

Widget customOverflowText(String text, Color color, double size,
    {fontWeight,
    int maxLines = 2,
    TextAlign? textAlign = TextAlign.center,
    TextOverflow? overflow}) {
  return Text(text,
      overflow: overflow ?? TextOverflow.ellipsis,
      textAlign: textAlign,
      maxLines: maxLines,
      style: customizeTextStyle(
        fontWeight,
        size,
        color,
      ));
}

Widget customOnlyText(
  String data, {
  Key? key,
  TextStyle? style,
  StrutStyle? strutStyle,
  TextAlign? textAlign,
  Locale? locale,
  bool? softWrap,
  TextOverflow? overflow,
  double? textScaleFactor,
  int? maxLines,
  String? semanticsLabel,
  TextWidthBasis? textWidthBasis,
  TextHeightBehavior? textHeightBehavior,
  Color? selectionColor,
}) {
  return Text(
    data,
    key: key,
    style: style,
    strutStyle: strutStyle,
    textAlign: textAlign,
    locale: locale,
    softWrap: softWrap,
    overflow: overflow,
    textScaleFactor: textScaleFactor,
    maxLines: maxLines,
    semanticsLabel: semanticsLabel,
    textWidthBasis: textWidthBasis,
    textHeightBehavior: textHeightBehavior,
    selectionColor: selectionColor,
  );
}
