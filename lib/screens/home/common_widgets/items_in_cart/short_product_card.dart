import 'package:flutter/material.dart';
import 'package:shoppixa/utils/constants/app_english_text.dart';
import 'package:shoppixa/utils/custom_buttons/custom_out_line_btn.dart';

import '../../../../utils/custom_text.dart';
import '../product_model.dart';

class ShortProductCard extends StatelessWidget {
  final Product product;

  const ShortProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          product.thumbnail ?? "",
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
              customText(product.name ?? "", Colors.black, 16,
                  fontWeight: FontWeight.w500),
              const SizedBox(height: 5),
              Row(
                children: [
                  customText("${AppEnglishText().rupee}${product.ofrPrice}",
                      Colors.green, 20),
                  const SizedBox(width: 3),
                  customText("${AppEnglishText().rupee}${product.mrp}",
                      Colors.grey, 14,
                      lineThrough: true),
                ],
              ),
              CustomOutLineBtn(
                  onPressed: () {},
                  btnText: "Remove Item",
                  borderColor: Colors.red,
                  btnSize: MediaQuery.sizeOf(context).width * 0.49,
                  btnHeight: 35),
            ],
          ),
        ),
      ],
    );
  }
}
