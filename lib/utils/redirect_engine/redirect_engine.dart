import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../routes/route_config.dart';

class RedirectEngine {
  Future<void> redirectRoutes(
      {required Uri redirectUrl, int delayedSeconds = 0}) async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Future.delayed(Duration(seconds: delayedSeconds), () async {
        RouteConfig routerManager = RouteConfig.instance;
        String fragment = redirectUrl.toString().replaceAll("baseURL", "");

        kIsWeb
            ? routerManager.router.go(fragment)
            : routerManager.router.push(fragment);
      });
    });
  }

  void clearAndNavigate(String path) {
    RouteConfig routerManager = RouteConfig.instance;
    if (!kIsWeb) {
      while (routerManager.router.canPop() == true) {
        routerManager.router.pop();
      }
      routerManager.router.pushReplacement(path);
    } else {
      routerManager.router.goNamed(path);
    }
  }
}
