import 'package:go_router/go_router.dart';
import 'package:shoppixa/screens/auth/login.dart';
import 'package:shoppixa/screens/auth/register.dart';
import 'package:shoppixa/screens/home/home.dart';
import 'package:shoppixa/screens/super_pdf/super_pdf.dart';
import 'package:shoppixa/utils/routes/route_names.dart';

import '../../screens/notification_view/notification_screen.dart';
import '../logger.dart';

class RouteConfig {
  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      /*GoRoute(
        path: MyRoutes.home,
        name: MyRoutes.home,
        builder: (_, GoRouterState state) {
          return const Home();
        },
      ),*/
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
          return const AppSignIn();
        },
      ),
      GoRoute(
        path: MyRoutes.register,
        name: MyRoutes.register,
        builder: (_, GoRouterState state) {
          return const AppSingUp();
        },
      ),
      GoRoute(
        path: MyRoutes.home,
        name: MyRoutes.home,
        builder: (_, GoRouterState state) {
          AppLog.i('message ${state.error}');
          return const SuperPdf();
        },
      ),
    ],
  );
}
