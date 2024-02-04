import 'package:flutter/cupertino.dart';
import 'package:shoppixa/resources/local_storeage/save_pincode/saved_pincode_sp.dart';
import 'package:shoppixa/utils/logger.dart';

class BottomNavBarVm with ChangeNotifier {
  BottomNavBarVm() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await SavedPinCodeSp().init();
      Future.delayed(Duration(seconds: 1), () async {
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
}
