import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shoppixa/screens/bottom_nab_bar/vm/bottom_nav_bar_vm.dart';
import 'package:shoppixa/screens/choose_location/address.dart';
import 'package:shoppixa/utils/constants/app_color.dart';
import 'package:shoppixa/utils/custom_text.dart';
import 'package:shoppixa/utils/logger.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool val) {
        AppLog.w("onPopInvoked $val");
      },
      child: ChangeNotifierProvider(
        create: (_) => BottomNavBarVm(),
        child: Consumer<BottomNavBarVm>(builder: (context, bottomNavBm, __) {
          return Scaffold(
            appBar: bottomNavBm.selectedIndex == 1
                ? null
                : AppBar(
                    backgroundColor: const Color(0xffffffff),
                    // backgroundColor: const Color(0xff1B6392),
                    leading: SvgPicture.asset(
                      "assets/logo/logo.svg",
                      height: 500,
                      width: 500,
                    ),
                    actions: [
                      Row(
                        children: [
                          customUnderlineText(
                              bottomNavBm.pinCode, appBaseColor, 16),
                          IconButton(
                            icon: const Icon(Icons.fmd_good_outlined),
                            onPressed: () async {
                              // RedirectEngine().redirectRoutes(redirectUrl: Uri.parse(MyRoutes.myLocation));
                              /*kIsWeb
                              ? context.goNamed(MyRoutes.myLocation)
                              : context.pushNamed(MyRoutes.myLocation);*/
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Addresses()),
                              );
                            },
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Badge(
                            padding: EdgeInsets.only(left: 10),
                            child: Icon(Icons.notifications_active_outlined)),
                        onPressed: () {},
                      ),
                    ],
                  ),
            body: Center(
              child: bottomNavBm.widgetOptions
                  .elementAt(bottomNavBm.selectedIndex),
            ),
            bottomNavigationBar: NavigationBar(
              onDestinationSelected: (int index) async {
                await bottomNavBm.setSelectedIndex(index);
              },
              indicatorColor: appBaseColor,
              selectedIndex: bottomNavBm.selectedIndex,
              destinations: const <Widget>[
                NavigationDestination(
                  selectedIcon: Icon(Icons.home, color: Colors.white),
                  icon: Icon(Icons.home_outlined, color: Colors.grey),
                  label: 'Home',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.shopping_cart, color: Colors.white),
                  icon: Badge(
                      label: Text("5"),
                      child: Icon(Icons.shopping_cart_outlined,
                          color: Colors.grey)),
                  label: 'Cart',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.favorite, color: Colors.white),
                  icon: Icon(Icons.favorite_border, color: Colors.grey),
                  label: 'Wishlist',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.account_circle, color: Colors.white),
                  icon: Icon(Icons.account_circle_outlined, color: Colors.grey),
                  label: 'You',
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
