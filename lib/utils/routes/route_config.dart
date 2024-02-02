import 'package:go_router/go_router.dart';
import 'package:shoppixa/screens/auth/login.dart';
import 'package:shoppixa/screens/auth/register.dart';
import 'package:shoppixa/screens/choose_location/choose_location.dart';
import 'package:shoppixa/screens/super_pdf/super_pdf.dart';
import 'package:shoppixa/utils/routes/route_names.dart';

import '../../screens/bottom_nab_bar/bottom_nav_bar.dart';
import '../../screens/intro/intro_view.dart';
import '../../screens/notification_view/notification_screen.dart';
import '../logger.dart';

class RouteConfig {
  static RouteConfig? _instance;

  RouteConfig._privateConstructor();

  static RouteConfig get instance {
    _instance ??= RouteConfig._privateConstructor();
    return _instance!;
  }

  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: MyRoutes.intro,
        name: MyRoutes.intro,
        builder: (_, GoRouterState state) {
          return IntroView();
        },
      ),
      GoRoute(
        path: MyRoutes.home,
        name: MyRoutes.home,
        builder: (_, GoRouterState state) {
          return const BottomNavBarView();
          // return const Home();
        },
      ),
      GoRoute(
        path: MyRoutes.notification,
        name: MyRoutes.notification,
        builder: (_, GoRouterState state) {
          AppLog.w('message ${state.extra}');
          return NotificationScreen(
            dataFromNotification: state.extra as Map<String, dynamic>,
          );
        },
      ),
      GoRoute(
        path: MyRoutes.login,
        name: MyRoutes.login,
        builder: (_, GoRouterState state) {
          return AppSignIn();
        },
      ),
      GoRoute(
        path: MyRoutes.register,
        name: MyRoutes.register,
        builder: (_, GoRouterState state) {
          return AppSingUp();
        },
      ),
      GoRoute(
        path: MyRoutes.myLocation,
        name: MyRoutes.myLocation,
        builder: (_, GoRouterState state) {
          return ChooseLocation();
        },
      ),
      GoRoute(
        path: MyRoutes.superPdf,
        name: MyRoutes.superPdf,
        builder: (_, GoRouterState state) {
          return SuperPdf();
        },
      ),
    ],
  );
}