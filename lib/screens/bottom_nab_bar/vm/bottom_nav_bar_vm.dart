import 'package:flutter/cupertino.dart';
import 'package:shoppixa/resources/local_storeage/save_pincode/saved_pincode_sp.dart';
import 'package:shoppixa/screens/wishlist/wishlist.dart';
import 'package:shoppixa/utils/logger.dart';
import 'package:shoppixa/utils/routes/customRoute.dart';
import 'package:shoppixa/utils/routes/route_names.dart';

import '../../../resources/local_storeage/token_sp/token_sp.dart';
import '../../cart/cart_view.dart';
import '../../home/home.dart';
import '../../profile/user_profile.dart';

class BottomNavBarVm with ChangeNotifier {
  BottomNavBarVm() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await SavedPinCodeSp().init().then((value) async {
        await setPinCode();
      });
    });
  }

  String pinCode = "";

  Future<void> setPinCode() async {
    pinCode = await SavedPinCodeSp().getSavedPinCode() ?? "";
    AppLog.i("setPinCode $pinCode");
    notifyListeners();
  }

  int selectedIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    const Home(),
    const CartView(),
    const Wishlist(),
    UserProfile(),
  ];

  Future<void> setSelectedIndex(int index) async {
    selectedIndex = index;
    bool isLogin = await TokenSP().isLoginUser();
    if (selectedIndex == 1 || selectedIndex == 2 || selectedIndex == 3) {
      if (!isLogin) {
        CustomRoute().clearAndNavigate(MyRoutes.register);
      }
    }
    notifyListeners();
  }
}
