import 'package:flutter/material.dart';
import 'package:shoppixa/utils/constants/app_color.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: TextField(
        enabled: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
              width: 0.5,
              style: BorderStyle.solid,
            ),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: appBaseColor,
          ),
          fillColor: white,
          hintStyle: TextStyle(color: appBaseColor),
          hintText: "What would your like to buy?",
        ),
        autofocus: false,
      ),
    );
  }
}
