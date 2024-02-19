import 'package:go_router/go_router.dart';
import 'package:hypersdkflutter/hypersdkflutter.dart';
import 'package:shoppixa/screens/auth/modules/login/ui/login.dart';
import 'package:shoppixa/screens/cart/cart_view.dart';
import 'package:shoppixa/screens/choose_location/choose_location.dart';
import 'package:shoppixa/screens/home/common_widgets/product_model.dart';
import 'package:shoppixa/screens/home/modules/more_category/ui/more_category_ui.dart';
import 'package:shoppixa/screens/payment/juspay_ui.dart';
import 'package:shoppixa/screens/payment/payment_page.dart';
import 'package:shoppixa/screens/product_details/product_details_view.dart';
import 'package:shoppixa/screens/profile/user_profile.dart';
import 'package:shoppixa/screens/super_pdf/super_pdf.dart';
import 'package:shoppixa/screens/wishlist/wishlist.dart';
import 'package:shoppixa/utils/routes/route_names.dart';

import '../../screens/auth/modules/register/ui/register.dart';
import '../../screens/bottom_nab_bar/bottom_nav_bar.dart';
import '../../screens/choose_location/address.dart';
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
          return const IntroView();
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
          AppLog.w('NotificationScreen ${state.extra}');
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
        path: MyRoutes.myLocation,
        name: MyRoutes.myLocation,
        builder: (_, GoRouterState state) {
          return const Addresses();
        },
      ),
      GoRoute(
        path: MyRoutes.currentLocation,
        name: MyRoutes.currentLocation,
        builder: (_, GoRouterState state) {
          return const ChooseCurrentLocation();
        },
      ),
      GoRoute(
        path: MyRoutes.superPdf,
        name: MyRoutes.superPdf,
        builder: (_, GoRouterState state) {
          return const SuperPdf();
        },
      ),
      GoRoute(
        path: MyRoutes.cart,
        name: MyRoutes.cart,
        builder: (_, GoRouterState state) {
          return const CartView();
        },
      ),
      GoRoute(
        path: MyRoutes.wishlist,
        name: MyRoutes.wishlist,
        builder: (_, GoRouterState state) {
          return const Wishlist();
        },
      ),
      GoRoute(
        path: MyRoutes.profile,
        name: MyRoutes.profile,
        builder: (_, GoRouterState state) {
          return UserProfile();
        },
      ),
      GoRoute(
        path: MyRoutes.product_details,
        name: MyRoutes.product_details,
        builder: (_, GoRouterState state) {
          AppLog.w('product_details ${state.extra}');
          return ProductDetailsView(product: state.extra as Product);
        },
      ),
      GoRoute(
        path: MyRoutes.moreCategory,
        name: MyRoutes.moreCategory,
        builder: (_, GoRouterState state) {
          return const MoreCategory();
        },
      ),
      GoRoute(
        path: MyRoutes.juspayUI,
        name: MyRoutes.juspayUI,
        builder: (_, GoRouterState state) {
          return JuspayUI(hyperSDK: state.extra as HyperSDK);
        },
      ),
      GoRoute(
        path: MyRoutes.paymentView,
        name: MyRoutes.paymentView,
        builder: (_, GoRouterState state) {
          return const PaymentPage();
        },
      ),
    ],
  );
}
