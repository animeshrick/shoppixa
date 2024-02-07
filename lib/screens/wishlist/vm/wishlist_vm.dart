import 'package:flutter/cupertino.dart';

class WishListVm with ChangeNotifier {
  WishListVm() {}

  bool isFav = false;

  void setFavourite() {
    isFav = !isFav;
    notifyListeners();
  }
}
