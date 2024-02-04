import 'package:flutter/material.dart';

import '../product_model.dart';
import '../top_selling/top_header.dart';
import 'short_product_card.dart';

class ItemsInCart extends StatelessWidget {
  ItemsInCart({super.key});

  final List<Product> products = [
    Product(
        'iPhone 15', 'Buy iPhone 15', 'assets/logo/intro.jpg', "1500", "150",false),
    Product('Apple Macbook M2', 'Buy 13-inch MacBook Air with M2 Chip',
        'assets/logo/intro.jpg', "14991", "1750",false),
    Product('Smart Watch', 'Smart Watches - Up to 70% Off - Buy Premium',
        'assets/logo/intro.jpg', "1000", "250",false),
    Product('Water Purifier', 'Buy Best Water Purifier | Water Filter For Home',
        'assets/logo/intro.jpg', "500", "450",false),
  ];

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
                  return ShortProductCard(product: products.elementAt(index));
                }),
          ),
        ],
      ),
    );
  }
}
