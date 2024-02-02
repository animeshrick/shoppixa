import 'package:flutter/material.dart';
import 'package:shoppixa/screens/home/common_widgets/top_selling/top_selling.dart';
import 'package:shoppixa/screens/home/greetings.dart';
import 'package:shoppixa/utils/custom_text.dart';

import '../../firebase/notification/notification_service.dart';
import 'common_widgets/items_in_cart/item_in_cart.dart';
import 'common_widgets/popular_menu.dart';
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
              TopSelling(),
              ItemsInCart(),
            ],
          ),
        ),
      ),
    );
  }
}
