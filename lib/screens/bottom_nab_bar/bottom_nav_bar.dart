import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoppixa/screens/cart/cart_view.dart';
import 'package:shoppixa/screens/home/home.dart';
import 'package:shoppixa/screens/more_options/more_options.dart';
import 'package:shoppixa/screens/profile/user_profile.dart';
import 'package:shoppixa/utils/constants/app_color.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    CartView(),
    MoreOptions(),
    UserProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        // backgroundColor: const Color(0xff1B6392),
        leading: SvgPicture.asset(
          "assets/logo/logo.svg",
          height: 500,
          width: 500,
        ),
        actions: [
          IconButton(
            icon: const Badge(
                padding: EdgeInsets.only(left: 10),
                child: Icon(Icons.notifications_active_outlined)),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        indicatorColor: appBaseColor,
        selectedIndex: _selectedIndex,
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
                child: Icon(Icons.shopping_cart_outlined, color: Colors.grey)),
            label: 'Cart',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.account_circle, color: Colors.white),
            icon: Icon(Icons.account_circle_outlined, color: Colors.grey),
            label: 'You',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.account_tree, color: Colors.white),
            icon: Icon(Icons.account_tree_outlined, color: Colors.grey),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
