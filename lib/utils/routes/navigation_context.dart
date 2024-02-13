import 'package:flutter/material.dart';
import 'package:shoppixa/utils/routes/route_config.dart';

/*class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}*/

class CurrentContext {
  BuildContext context =
      RouteConfig.instance.router.routerDelegate.navigatorKey.currentContext!;
}
