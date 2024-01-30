import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:shoppixa/screens/super_pdf/save_file.dart';
import 'package:shoppixa/screens/super_pdf/save_file_web.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class AddBookmarkPdf {
  Future<void> addBookmarksToPDF() async {
    //Create a new document
    PdfDocument document = PdfDocument();
    //Adds a page
    PdfPage page = document.pages.add();
    //Creates a bookmark
    PdfBookmark bookmark = document.bookmarks.add('Chapter 1');
    //Sets the destination page and location
    bookmark.destination = PdfDestination(page, const Offset(10, 10));
    //Draw the content in the PDF page
    page.graphics.drawString(
        'Chapter1', PdfStandardFont(PdfFontFamily.helvetica, 10),
        brush: PdfBrushes.red, bounds: const Rect.fromLTWH(10, 10, 0, 0));
    //Adds the child bookmark
    PdfBookmark childBookmark = bookmark.insert(0, 'Section 1');
    childBookmark.destination = PdfDestination(page, const Offset(30, 30));
    //Draw the content in the PDF page
    page.graphics.drawString(
        'Section1', PdfStandardFont(PdfFontFamily.helvetica, 10),
        brush: PdfBrushes.green, bounds: const Rect.fromLTWH(30, 30, 0, 0));
    //Sets the text style and color
    bookmark.textStyle = [PdfTextStyle.bold];
    bookmark.color = PdfColor(255, 0, 0);
    //Save the document
    List<int> bytes = await document.save();
    //Dispose the document.
    document.dispose();
    //Save the file and launch/download.
    if (kIsWeb) {
      SaveFileWeb.saveAndLaunchFileWeb(bytes, 'output_web.pdf');
    } else {
      SaveFile.saveAndLaunchFile(bytes, 'output.pdf');
    }
  }
}
