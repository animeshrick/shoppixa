import 'package:go_router/go_router.dart';
import 'package:shoppixa/screens/auth/login.dart';
import 'package:shoppixa/screens/home.dart';
import 'package:shoppixa/screens/notification_screen.dart';
import 'package:shoppixa/utils/log.dart';
import 'package:shoppixa/utils/routes/route_names.dart';

class RouteConfig {
  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: MyRoutes.home,
        name: MyRoutes.home,
        builder: (_, GoRouterState state) {
          return const Home();
        },
      ),
/*      GoRoute(
        path: MyRoutes.register,
        name: MyRoutes.register,
        builder: (_, GoRouterState state) {
          return Register();
        },
      ),*/
      GoRoute(
        path: MyRoutes.login,
        name: MyRoutes.login,
        builder: (_, GoRouterState state) {
          return LoginScreen();
        },
      ),
      GoRoute(
        path: MyRoutes.notification,
        name: MyRoutes.notification,
        builder: (_, GoRouterState state) {
          AppLog().log('message ${state.extra}');
          return NotificationScreen(
            dataFromNotification: state.extra as Map<String, dynamic>,
          );
        },
      ),
    ],
  );
}