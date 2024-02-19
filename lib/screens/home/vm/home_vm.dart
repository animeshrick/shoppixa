import 'package:flutter/material.dart';

import '../../../firebase/notification/notification_service.dart';

class HomeVm with ChangeNotifier {
  HomeVm(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await setUpFirebase();
    });
  }

  Future<void> setUpFirebase() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      FirebaseNotificationService firebaseNotificationService =
          FirebaseNotificationService();

      ///fcm-permission
      if (await FirebaseNotificationService().checkNotificationStatus() !=
          "authorized") {
        await firebaseNotificationService.requestNotificationPermission();
      }
      firebaseNotificationService.firebaseInit();

      await firebaseNotificationService.setupInteractMessage();

      /// fcm-token
      await firebaseNotificationService.getDeviceToken();
    });
  }
}
