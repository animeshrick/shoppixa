import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/local_storeage/cart/cart_model.dart';
import 'components/cart_card.dart';
import 'components/checkout_card.dart';
import 'components/coupon/coupon.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: Column(
            children: [
              const Coupon(),
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
      ),
    );
  }
}
