import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoppixa/screens/cart/components/cart_bottom_bar.dart';
import 'package:shoppixa/screens/cart/components/cart_item.dart';
import 'package:shoppixa/screens/cart/components/deliverable_address.dart';

import '../../resources/local_storeage/cart/cart_model.dart';
import '../../utils/custom_text.dart';
import '../home/common_widgets/product_model.dart';
import 'components/cart_card.dart';
import 'components/checkout_card.dart';
import 'components/coupon/coupon.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final List<Product> products = [
    Product("1232",'Meet the new iPhone 15 Pro Max - Apple Official Site',
        'Buy iPhone 15', 'assets/logo/intro.jpg', "1500", "150", false),
    Product("1231",'Apple Macbook M2', 'Buy 13-inch MacBook Air with M2 Chip',
        'assets/logo/intro.jpg', "14991", "1750", false),
    Product("1239",'Smart Watch', 'Smart Watches - Up to 70% Off - Buy Premium',
        'assets/logo/intro.jpg', "1000", "250", false),
    Product("123423",
        'Aro Water Purifier',
        'Buy Best Water Purifier | Water Filter For Home',
        'assets/logo/intro.jpg',
        "500",
        "450",
        false),
    Product("123434",'Men Jeans', '', 'assets/logo/intro.jpg', "5500", "2500", false),
    Product("123424",'Men Jeans', '', 'assets/logo/intro.jpg', "5500", "2500", false),
    Product("12353",'Men Jeans', '', 'assets/logo/intro.jpg', "5500", "2500", false),
    Product("1234245",'Men Jeans', '', 'assets/logo/intro.jpg', "5500", "2500", false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: customText("My Cart", Colors.black, 22,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            DeliverableAddress(),
            Coupon(),
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
      ),*/
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
        // padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
        child: Column(
          children: [
           /* Center(
              child: customText("My Cart", Colors.black, 22,
                  fontWeight: FontWeight.w500),
            ),*/
            Coupon(),
            Expanded(
              child: ListView.builder(
                itemCount: demoCarts.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Dismissible(
                    key: Key(demoCarts[index].product.pID.toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      setState(() {
                        demoCarts.removeAt(index);
                      });
                    },
                    background: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFE6E6),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          const Spacer(),
                          SvgPicture.asset("assets/icons/Trash.svg"),
                        ],
                      ),
                    ),
                    child: CartCard(cart: demoCarts[index]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
        bottomNavigationBar: const CheckoutCard(),
    );
  }
}
