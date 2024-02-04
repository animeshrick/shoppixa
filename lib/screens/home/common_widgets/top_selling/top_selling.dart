import 'package:flutter/material.dart';
import 'package:shoppixa/screens/home/common_widgets/top_selling/top_header.dart';
import 'package:shoppixa/screens/home/common_widgets/top_selling/top_header_item.dart';

import '../product_model.dart';

class TopSelling extends StatelessWidget {
  final List<Product> products = [
    Product(
        'iPhone 15', 'Buy iPhone 15', 'assets/logo/intro.jpg', "1500", "150",false),
    Product('Apple Macbook M2', 'Buy 13-inch MacBook Air with M2 Chip',
        'assets/logo/intro.jpg', "14991", "1750",false),
    Product('Smart Watch', 'Smart Watches - Up to 70% Off - Buy Premium',
        'assets/logo/intro.jpg', "1000", "250",false),
    Product('Water Purifier', 'Buy Best Water Purifier | Water Filter For Home',
        'assets/logo/intro.jpg', "500", "450",false),
    Product('Woman Ware', 'Buy Best quality product', 'assets/logo/intro.jpg',
        "500", "50",false),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          TopHeader(
            headerTitle: 'Top Selling',
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
                  return TopHeaderItem(product: products.elementAt(index));
                }),
          ),
        ],
      ),
    );
  }
}
