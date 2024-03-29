import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppixa/resources/local_storeage/token_sp/token_sp.dart';
import 'package:shoppixa/utils/routes/navigation_context.dart';
import 'package:shoppixa/utils/routes/route_config.dart';
import 'package:shoppixa/utils/routes/route_names.dart';
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await TokenSP().init();
      bool isLogin = await TokenSP().isLoginUser();
      if (!isLogin) {
        CurrentContext().context.goNamed(MyRoutes.intro);
      } else {
        CurrentContext().context.goNamed(MyRoutes.home);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: RouteConfig.instance.router,
    );
  }
}
