import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoppixa/screens/home/common_widgets/top_selling/top_selling.dart';
import 'package:shoppixa/utils/custom_buttons/custom_icon_button.dart';
import 'package:shoppixa/utils/redirect_engine/redirect_engine.dart';
import 'package:shoppixa/utils/routes/route_names.dart';

import '../../firebase/notification/notification_service.dart';
import 'common_widgets/items_in_cart/item_in_cart.dart';
import 'common_widgets/popular_menu.dart';
import 'common_widgets/product_model.dart';
import 'common_widgets/search_widget.dart';
import 'common_widgets/top_promo_slider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseNotificationService firebaseNotificationService =
      FirebaseNotificationService();

  final List<Product> products = [
    Product('Product 1', 'Description 1', 'assets/logo/intro.jpg'),
    Product('Product 2', 'Description 2', 'assets/logo/intro.jpg'),
    Product('Product 3', 'Description 3', 'assets/logo/intro.jpg'),
    Product('Product 4', 'Description 4', 'assets/logo/intro.jpg'),
    Product('Product 4', 'Description 4', 'assets/logo/intro.jpg'),
    Product('Product 4', 'Description 4', 'assets/logo/intro.jpg'),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await firebaseNotificationService.requestNotificationPermission();
      firebaseNotificationService.firebaseInit(context);
      firebaseNotificationService.setupInteractMessage(context);
      await firebaseNotificationService.getDeviceToken();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffffffff),
          // backgroundColor: const Color(0xff1B6392),
          leading: SvgPicture.asset(
            "assets/logo/logo.svg",
            height: 500,
            width: 500,
          ),
          actions: [
            customIconButton(
                onPressed: () {},
                badgeContent: "5",
                iconColor: const Color(0xff1B6392),
                icon: Icons.shopping_cart_outlined),
            customIconButton(
                onPressed: () {
                  RedirectEngine().redirectRoutes(
                      redirectUrl: Uri.parse(MyRoutes.superPdf));
                },
                iconColor: const Color(0xff1B6392),
                icon: Icons.notifications_active_outlined),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // const AutoScrollText(),
              const PromoImageSlider(),
              const SearchWidget(),
              PopularMenu(),
              TopSelling(),
              ItemsInCart(),
            ],
          ),
        ),
      ),
    );
  }
}
