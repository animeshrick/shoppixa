import 'package:flutter/cupertino.dart';
import 'package:shoppixa/resources/local_storeage/save_pincode/saved_pincode_sp.dart';
import 'package:shoppixa/utils/logger.dart';

import '../../cart/cart_view.dart';
import '../../home/home.dart';
import '../../more_options/more_options.dart';
import '../../profile/user_profile.dart';

class BottomNavBarVm with ChangeNotifier {
  BottomNavBarVm() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await SavedPinCodeSp().init();
      Future.delayed(const Duration(seconds: 1), () async {
        await setPinCode();
      });
    });
  }

  String pinCode = ""; //SavedPinCode().getSavedPinCode() ?? "";

  Future<void> setPinCode() async {
    pinCode = await SavedPinCodeSp().getSavedPinCode() ?? "";
    AppLog.i("setPinCode $pinCode");
    notifyListeners();
  }

  int selectedIndex = 0;
   List<Widget> widgetOptions = <Widget>[
    const Home(),
    const CartView(),
    const MoreOptions(),
    const UserProfile(),
  ];

  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
