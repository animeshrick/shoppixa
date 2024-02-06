import 'package:flutter/material.dart';
import 'package:shoppixa/screens/cart/cart_bottom_bar.dart';
import 'package:shoppixa/screens/cart/cart_item.dart';
import 'package:shoppixa/screens/cart/deliverable_address.dart';

import '../../utils/custom_text.dart';
import '../home/common_widgets/product_model.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final List<Product> products = [
    Product('Meet the new iPhone 15 Pro Max - Apple Official Site',
        'Buy iPhone 15', 'assets/logo/intro.jpg', "1500", "150",false),
    Product('Apple Macbook M2', 'Buy 13-inch MacBook Air with M2 Chip',
        'assets/logo/intro.jpg', "14991", "1750",false),
    Product('Smart Watch', 'Smart Watches - Up to 70% Off - Buy Premium',
        'assets/logo/intro.jpg', "1000", "250",false),
    Product(
        'Aro Water Purifier',
        'Buy Best Water Purifier | Water Filter For Home',
        'assets/logo/intro.jpg',
        "500",
        "450",false),
    Product('Men Jeans', '', 'assets/logo/intro.jpg', "5500", "2500",false),
    Product('Men Jeans', '', 'assets/logo/intro.jpg', "5500", "2500",false),
    Product('Men Jeans', '', 'assets/logo/intro.jpg', "5500", "2500",false),
    Product('Men Jeans', '', 'assets/logo/intro.jpg', "5500", "2500",false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: customText("My Cart", Colors.black, 22,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10,),
            DeliverableAddress(),
            Expanded(
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (_, int i) {
                    Product product = products.elementAt(i);
                    return CartItem(product: product);
                  }),
            ),
            CartBottomBar(),
          ],
        ),
      ),
    );
  }
}
