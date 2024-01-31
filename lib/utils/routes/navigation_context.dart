import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoppixa/utils/routes/route_config.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

class CurrentContext {
  BuildContext context = kIsWeb
      ? RouteConfig.instance.router.routerDelegate.navigatorKey.currentContext!
      : NavigationService.navigatorKey.currentContext!;

  String? currentPath = kIsWeb
      ? RouteConfig.instance.router.routeInformationProvider.value.location
      : ModalRoute.of(NavigationService.navigatorKey.currentContext!)
          ?.settings
          .name;
}
