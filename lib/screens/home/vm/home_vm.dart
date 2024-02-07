import 'package:flutter/material.dart';

import '../../../firebase/notification/notification_service.dart';

class HomeVm with ChangeNotifier {
  HomeVm(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await firebaseNotificationService.requestNotificationPermission();
      firebaseNotificationService.firebaseInit(context);
      firebaseNotificationService.setupInteractMessage(context);
      await firebaseNotificationService.getDeviceToken();
    });
  }

  FirebaseNotificationService firebaseNotificationService =
      FirebaseNotificationService();
}
