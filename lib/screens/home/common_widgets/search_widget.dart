import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:shoppixa/utils/constants/app_color.dart';
import 'package:shoppixa/utils/custom_text.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<AnimatedText> searchThings = [
      RotateAnimatedText('Shirt'),
      RotateAnimatedText('Jens'),
      RotateAnimatedText('iPhone'),
      RotateAnimatedText('Laptop'),
      RotateAnimatedText('Watches'),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CircleAvatar(
                  backgroundColor: Colors.black12,
                  child: IconButton(
                    icon: const Icon(Icons.search),
                    color: appBaseColor,
                    onPressed: () {
                      // Handle search action
                    },
                  ),
                ),
              ),
              Row(
                children: [
                  customText("What would your like to buy?", Colors.black, 14),
                  const SizedBox(width: 5),
                  DefaultTextStyle(
                    style:
                        customizeTextStyle(FontWeight.normal, 14, Colors.black),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: searchThings,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
