import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoppixa/utils/routes/route_config.dart';
import 'package:url_strategy/url_strategy.dart';

import 'firebase_options.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  if (kDebugMode) {
    debugPrint('firebase BG body: ${message.notification?.body ?? ""}');
    debugPrint('firebase BG title: ${message.notification?.title ?? ""}');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RouteConfig().router,
    );
  }
}


/*
MaterialApp.router(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown
          },
        ),
        title: 'RetailerShakti',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blueGrey,
            surface: Colors.blueAccent,
            onSurface: Colors.black,
          ),
          useMaterial3: true,
        ),
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(
                start: 0, end: ScreenSizeConst.mobile, name: MOBILE),
            const Breakpoint(
                start: ScreenSizeConst.mobile + 1,
                end: ScreenSizeConst.tablet,
                name: TABLET),
            const Breakpoint(
                start: ScreenSizeConst.tablet + 1,
                end: ScreenSizeConst.desktop,
                name: DESKTOP),
            const Breakpoint(
                start: ScreenSizeConst.desktop + 1,
                end: double.infinity,
                name: '4K'),
          ],
        ),
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
*/
