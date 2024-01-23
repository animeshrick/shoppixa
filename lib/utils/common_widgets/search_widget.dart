import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Theme(
          data: Theme.of(context).copyWith(
            primaryColor: Colors.grey[600],
          ),
          child: const TextField(
            enabled: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(
                  width: 0.5,
                  style: BorderStyle.solid,
                ),
              ),
              filled: true,
              prefixIcon: Icon(Icons.search,color: Color(0xff1B6392),),
              fillColor: Color(0xFFF2F4F5),
              hintStyle: TextStyle(color: Color(0xff1B6392)),
              hintText: "What would your like to buy?",
            ),
            autofocus: false,
          )),
    );
  }
}
