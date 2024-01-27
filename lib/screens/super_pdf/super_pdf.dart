import 'package:flutter/material.dart';
import 'package:shoppixa/screens/super_pdf/add_bm.dart';

class SuperPdf extends StatelessWidget {
  const SuperPdf({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.blue)),
              onPressed: () async {
                await AddBookmarkPdf().addBookmarksToPDF();
              },
              child: const Text(
                'Create sample',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
