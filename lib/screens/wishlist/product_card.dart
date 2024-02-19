import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppixa/utils/constants/app_english_text.dart';
import 'package:shoppixa/utils/custom_text.dart';
import 'package:shoppixa/utils/routes/route_names.dart';

import '../home/common_widgets/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    required this.product,
    required this.onPressProduct,
    required this.onPressFav,
  }) : super(key: key);

  final double width;
  final Product product;
  final VoidCallback onPressProduct;
  final VoidCallback onPressFav;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      child: GestureDetector(
        onTap: () {
          context.go(MyRoutes.product_details, extra: product);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: onPressProduct,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    // color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(product.thumbnail ?? "",
                      height: 80, fit: BoxFit.cover, width: double.infinity),
                ),
                const SizedBox(height: 8),
                customText(product.name ?? "", Colors.black, 16,
                    fontWeight: FontWeight.w500),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        customText(
                            "${AppEnglishText().rupee}${product.ofrPrice}",
                            Colors.black,
                            16),
                        customText(
                          "${AppEnglishText().rupee}${product.mrp}",
                          Colors.grey,
                          12,
                          lineThrough: true,
                        ),
                      ],
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: onPressFav,
                      child: Container(
                          padding: const EdgeInsets.all(6),
                          // height: 24,
                          // width: 24,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.4),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            product.isFavourite ?? false
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.pink,
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
