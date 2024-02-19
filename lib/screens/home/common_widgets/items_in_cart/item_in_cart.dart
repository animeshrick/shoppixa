import 'package:flutter/material.dart';

import '../product_model.dart';
import '../top_selling/top_header.dart';
import 'short_product_card.dart';

class ItemsInCart extends StatelessWidget {
  ItemsInCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TopHeader(
            headerTitle: '4 Items in your Cart',
            headerOnTap: () {},
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.separated(
                shrinkWrap: true,
                primary: false,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemCount: products.length,
                itemBuilder: (_, int index) {
                  return GestureDetector(
                      onTap: () {},
                      child:
                          ShortProductCard(product: products.elementAt(index)));
                }),
          ),
        ],
      ),
    );
  }
}
