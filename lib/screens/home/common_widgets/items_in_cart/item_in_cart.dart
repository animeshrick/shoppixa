import 'package:flutter/material.dart';

import '../product_model.dart';
import '../top_selling/top_header.dart';
import '../top_selling/top_header_item.dart';

class ItemsInCart extends StatelessWidget {
  ItemsInCart({super.key});

  final List<Product> products = [
    Product('iPhone', 'Buy iPhone 15', 'assets/logo/intro.jpg'),
    Product('Apple Macbook M2', 'Buy 13-inch MacBook Air with M2 Chip',
        'assets/logo/intro.jpg'),
    Product('Smart Watch', 'Smart Watches - Up to 70% Off - Buy Premium',
        'assets/logo/intro.jpg'),
    Product('Water Purifier', 'Buy Best Water Purifier | Water Filter For Home',
        'assets/logo/intro.jpg'),
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
            height: MediaQuery.of(context).size.height * 0.4,
            child: ListView.separated(
                shrinkWrap: true,
                primary: false,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemCount: products.length,
                itemBuilder: (_, int index) {
                  return TopHeaderItem(product: products.elementAt(index));
                }),
          ),
        ],
      ),
    );
  }
}
