import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shoppixa/resources/local_storeage/intro_screen_sp/intro_screen_sp.dart';

class IntroVm with ChangeNotifier {
  IntroVm() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await IntroScreenSp().init();
    });
  }
}
