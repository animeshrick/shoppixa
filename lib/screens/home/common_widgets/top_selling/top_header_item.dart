import 'package:flutter/material.dart';

import '../../../../utils/constants/app_english_text.dart';
import '../../../../utils/custom_text.dart';
import '../product_model.dart';

class TopHeaderItem extends StatelessWidget {
  final Product product;

  const TopHeaderItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          product.imageUrl,
          height: 110.0,
          fit: BoxFit.cover,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          height: 135,
          decoration: const BoxDecoration(
            color: Color(0xfff5f1f1),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: Column(
            children: [
              customText(product.name, Colors.black, 16,
                  fontWeight: FontWeight.w500),
              SizedBox(
                  width: 200,
                  child: customOverflowText(
                      product.description, Colors.grey, 14,
                      maxLines: 2, textAlign: TextAlign.center)),
              const SizedBox(height: 5),
              Row(
                children: [
                  customText("${AppEnglishText().rupee}${product.ofrPrice}",
                      Colors.green, 30),
                  const SizedBox(width: 3),
                  customText("${AppEnglishText().rupee}${product.mrp}",
                      Colors.grey, 20,
                      lineThrough: true),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
