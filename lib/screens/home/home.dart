import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppixa/utils/common_widgets/auto_scroll_text.dart';
import 'package:shoppixa/utils/routes/route_names.dart';

import '../../firebase/notification/notification_service.dart';
import '../../utils/common_widgets/popular_menu.dart';
import '../../utils/common_widgets/search_widget.dart';
import '../../utils/common_widgets/top_promo_slider.dart';

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
        appBar: AppBar(
          backgroundColor: const Color(0xff1B6392),
          // backgroundColor: Color(0xfc9164d),
          /*leading: Icon(
            Icons.account_circle,
            color: Colors.white,
          ),*/
          leading: SvgPicture.asset(
              "assets/logo/logo.svg",
            height: 100,
            width: 100,
          ),
          // leading: Image.asset("assets/logo/app_logo.svg"),
          actions: [
            IconButton(
                onPressed: () {
                  kIsWeb
                      ? context.goNamed(MyRoutes.login)
                      : context.pushNamed(MyRoutes.login);
                },
                icon: const Icon(Icons.shopping_cart,color: Colors.white,))
          ],
        ),
        body: Column(
          children: <Widget>[
            const AutoScrollText(),
            const SearchWidget(),
            const TopPromoSlider(),
            PopularMenu(),
          ],
        ),
      ),
    );
  }
}
