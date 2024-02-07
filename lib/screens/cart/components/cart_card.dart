import 'package:flutter/material.dart';
import 'package:shoppixa/utils/custom_text.dart';

import '../../../resources/local_storeage/cart/cart_model.dart';
import '../../../utils/constants/app_color.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(cart.product.imageUrl),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.5,
                child: customOverflowText(cart.product.name, Colors.black, 16,
                    maxLines: 2, textAlign: TextAlign.start)),
            const SizedBox(height: 8),
            Text.rich(
              TextSpan(
                text: "\$${cart.product.ofrPrice}",
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: appBaseColor),
                children: [
                  TextSpan(
                      text: " x${cart.numOfItem}",
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
