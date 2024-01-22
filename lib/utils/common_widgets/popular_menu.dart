import 'package:flutter/material.dart';
import 'package:shoppixa/utils/custom_text.dart';

class PopularMenu extends StatelessWidget {
  double? width, height = 55.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: width,
                height: height,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
                child: RawMaterialButton(
                  onPressed: () {},
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.star_border,
                    color: Color(0xFFAB436B),
                  ),
                ),
              ),
              customText("Popular", Colors.black54, 13),
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                width: width,
                height: height,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
                child: RawMaterialButton(
                  onPressed: () {},
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.local_offer_outlined,
                    color: Color(0xFFC1A17C),
                  ),
                ),
              ),
              customText("Flash Sell", Colors.black54, 13),
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                width: width,
                height: height,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
                child: RawMaterialButton(
                  onPressed: () {},
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.storefront,
                    color: Color(0xFF5EB699),
                  ),
                ),
              ),
              customText('Sponsored', Colors.black54, 13),
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                width: width,
                height: height,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
                child: RawMaterialButton(
                  onPressed: () {},
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.clear_all_outlined,
                    color: Color(0xFF4D9DA7),
                  ),
                ),
              ),
              customText('All Categories', Colors.black54, 13),
            ],
          )
        ],
      ),
    );
  }
}
