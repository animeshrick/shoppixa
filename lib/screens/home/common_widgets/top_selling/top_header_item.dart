import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppixa/utils/extension/extended_sizedbox.dart';
import 'package:shoppixa/utils/routes/route_names.dart';

import '../../../../utils/constants/app_english_text.dart';
import '../../../../utils/custom_text.dart';
import '../product_model.dart';

class TopHeaderItem extends StatelessWidget {
  final Product product;

  const TopHeaderItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // ProductDetailsView
        context.go(MyRoutes.product_details, extra: product);
      },
      child: Column(
        children: [
          Image.asset(
            product.thumbnail ?? "",
            height: 110.0,
            fit: BoxFit.cover,
          ),
          10.ph,
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
                SizedBox(
                    width: 200,
                    child: customOverflowText(
                        product.description ?? "", Colors.grey, 14,
                        maxLines: 2, textAlign: TextAlign.center)),
                5.ph,
                Row(
                  children: [
                    customText("${AppEnglishText().rupee}${product.ofrPrice}",
                        Colors.green, 18,
                        fontWeight: FontWeight.w500),
                    const SizedBox(width: 3),
                    customText("${AppEnglishText().rupee}${product.mrp}",
                        Colors.grey, 14,
                        lineThrough: true),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
