import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppixa/screens/wishlist/product_card.dart';
import 'package:shoppixa/screens/wishlist/wishlist_vm.dart';
import 'package:shoppixa/utils/custom_text.dart';

import '../home/common_widgets/product_model.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product('iPhone 15', 'Buy iPhone 15', 'assets/logo/intro.jpg', "1500",
          "150", false),
      Product('Apple Macbook M2', 'Buy 13-inch MacBook Air with M2 Chip',
          'assets/logo/intro.jpg', "14991", "1750", true),
      Product('Smart Watch', 'Smart Watches - Up to 70% Off - Buy Premium',
          'assets/logo/intro.jpg', "1000", "250", false),
      Product(
          'Water Purifier',
          'Buy Best Water Purifier | Water Filter For Home',
          'assets/logo/intro.jpg',
          "500",
          "450",
          false),
      Product(
          'Water Purifier',
          'Buy Best Water Purifier | Water Filter For Home',
          'assets/logo/intro.jpg',
          "500",
          "450",
          false),
    ];

    return ChangeNotifierProvider(
      create: (_) => WishListVm(),
      child: Consumer<WishListVm>(builder: (context, wishListVm, _) {
        return SafeArea(
          child: Column(
            children: [
              customText("Your Collection", Colors.black, 22,fontWeight: FontWeight.w500),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: GridView.builder(
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 0.9,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) => ProductCard(
                      product: products[index],
                      onPressProduct: () {},
                      onPressFav: wishListVm.setFavourite,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
