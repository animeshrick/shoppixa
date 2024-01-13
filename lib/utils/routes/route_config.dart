import 'package:go_router/go_router.dart';
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
        /*pageBuilder: (_, GoRouterState state) {
          return Home();
        },*/
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

/*
class RouteConfigV2 {
  static GoRouter buildRouter() {
    return GoRouter(
      initialLocation: '/',
      navigatorBuilder: (context, state, action) {
        return Navigator(
          key: state.navigatorKey,
          pages: state.pages,
          onPopPage: (route, result) {
            if (!route.didPop(result)) {
              return false;
            }
            return true;
          },
        );
      },
      navigatorFunctions: [GoRouterFunction.onGenerate],
      builder: (BuildContext context, state, action) {
        return MaterialApp.router(
          routerDelegate: state.router.routerDelegate,
          routeInformationParser: state.router.routeInformationParser,
        );
      },
      initialPages: [
        // Define your initial pages here
        // For example, Home Page
        MaterialPage(child: HomePage(), key: ValueKey('home')),
      ],
      navigatorObservers: [GoNavigatorObserver()],
      navigatorKey: GlobalKey<NavigatorState>(),
      navigatorFunctionsOnInit: [
        (state, initialAction) {
          // Add any initialization logic here
        },
      ],
      routes: [
        // Define your routes here
        // For example, Details Page
        // Make sure to include any parameters in the route pattern
        // For example, '/details/:param'
        // You can use onBeforeEnter to handle authentication checks
        // You can use builder to create dynamic routes
        // You can use onBeforeExit to handle cleanup logic
        // For more advanced usage, refer to the go_router documentation
        // https://pub.dev/packages/go_router
        (state, parameters) => DetailsPage(),
        (state, parameters) => LoginPage(),
        (state, parameters) => UserPage(),
      ],
    );
  }
}
*/
