import 'package:flutter/foundation.dart';
import 'package:shoppixa/utils/routes/route_config.dart';
import 'package:shoppixa/utils/routes/route_names.dart';

import 'custom_router_web.dart';

class CustomRoute {
  void back({String? customPath}) {
    if (kIsWeb) {
      CustomRouterWeb().back();
    } else {
      if (RouteConfig.instance.router.canPop() == true) {
        RouteConfig.instance.router.pop();
      } else if (customPath != null && customPath.isNotEmpty == true) {
        clearAndNavigate(customPath);
      } else {
        clearAndNavigate(MyRoutes.home);
      }
    }
  }

  void secBack() {
    if (kIsWeb) {
      CustomRouterWeb().secBack();
    } else {
      RouteConfig.instance.router.pop();
      RouteConfig.instance.router.pop();
    }
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

/*  Future pushNamed({required String name, dynamic arguments}) {
    return Navigator.push(
        CurrentContext().context, getRoute(name: name, arguments: arguments));
  }*/
}
