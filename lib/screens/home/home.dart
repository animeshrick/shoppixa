import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppixa/screens/home/common_widgets/discount_banner.dart';
import 'package:shoppixa/screens/home/common_widgets/suggetions/special_for_you.dart';
import 'package:shoppixa/screens/home/common_widgets/top_selling/top_selling.dart';
import 'package:shoppixa/screens/home/greetings.dart';
import 'package:shoppixa/screens/home/vm/home_vm.dart';
import 'package:shoppixa/utils/custom_text.dart';

import 'common_widgets/items_in_cart/item_in_cart.dart';
import 'common_widgets/popular_menu.dart';
import 'common_widgets/search_widget.dart';
import 'common_widgets/top_promo_slider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeVm(context),
      child: Consumer<HomeVm>(builder: (context, homeVm, _) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: customText(
                        Greetings().generateGreeting(), Colors.black, 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 10),
                    child: customText("Lets gets something!", Colors.black, 14,
                        fontWeight: FontWeight.w300),
                  ),
                  const SearchWidget(),
                  const PromoImageSlider(),
                  PopularMenu(),
                  DiscountBanner(),
                  SpecialForYou(),
                  TopSelling(),
                  ItemsInCart(),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
