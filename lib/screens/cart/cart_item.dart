import 'package:flutter/material.dart';
import 'package:shoppixa/screens/home/common_widgets/product_model.dart';

import '../../utils/constants/app_color.dart';
import '../../utils/constants/app_english_text.dart';
import '../../utils/custom_text.dart';

class CartItem extends StatelessWidget {
  final Product product;

  const CartItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200]?.withOpacity(0.6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Wrap(
        spacing: 10,
        // runSpacing: 10,
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.spaceEvenly,
        children: [
          /// image
          Image.asset(
            product.imageUrl,
            width: 70,
          ),

          /// name + price
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                child: customOverflowText(product.name, Colors.black, 14,
                    fontWeight: FontWeight.w600,
                    maxLines: 2,
                    textAlign: TextAlign.start),
              ),
              const SizedBox(height: 5),
              Text(
                "${AppEnglishText().rupee}${product.ofrPrice}",
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 23,
                ),
              ),
            ],
          ),

          /// add - remove btns
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  splashRadius: 10.0,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.remove,
                    color: appBaseColor,
                  ),
                ),
                customText("5", Colors.black, 16),
                IconButton(
                  splashRadius: 10.0,
                  onPressed: () {},
                  icon: const Icon(Icons.add, color: appBaseColor),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
