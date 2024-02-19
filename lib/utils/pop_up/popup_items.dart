import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppixa/utils/pop_up/toaste.dart';

import '../constants/app_color.dart';
import '../custom_text.dart';
import '../routes/navigation_context.dart';

class PopUpItems {
  void popupLoader() {
    showDialog(
      barrierDismissible: false,
      context: CurrentContext().context,
      builder: (BuildContext context) {
        return const AlertDialog(
            backgroundColor: Colors.transparent,
            content: CircularProgressIndicator());
      },
    );
  }

  void showDialogWithMessage(String msg) {
    showDialog(
        context: CurrentContext().context,
        builder: (BuildContext context) {
          return Dialog(
              insetPadding: const EdgeInsets.all(5.0),
              child: Container(
                // padding: new EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: customText(msg, black, 18.0),
              ));
        });
  }

  void toastMessage(String message, Color color, {int? durationSeconds}) {
    SnackBar snackBar = SnackBar(
      duration: Duration(seconds: durationSeconds ?? 2),
      content: ToastMassage(message: message, color: color),
      elevation: 0,
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(5),
    );
    ScaffoldMessenger.of(CurrentContext().context).showSnackBar(snackBar);
  }

  Future<void> popUpAlert({
    required BuildContext context,
    String title = "",
    required Function()? cancelBtnPresses,
    required Function()? okBtnPressed,
    String content = "",
    String cancelBtnText = "",
    String okBtnText = "",
  }) async {
    await showCupertinoDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: customText(title, black, 14),
        content: customText(content, Colors.black, 16),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: cancelBtnPresses,
            child: customText(
                cancelBtnText.isEmpty ? 'Cancel' : cancelBtnText, black, 14),
          ),
          CupertinoDialogAction(
            onPressed: okBtnPressed,
            child: customText(okBtnText.isEmpty ? 'Ok' : okBtnText, black, 14),
          ),
        ],
      ),
    );
  }

  void cupertinoPictureOptions(BuildContext context,
      {required Function()? cameraPressed,
      required Function()? devicePressed}) {
    Platform.isAndroid
        ? showDialog<void>(
            context: context,
            builder: (BuildContext context) => CupertinoAlertDialog(
              title: customOnlyText('Choose From'),
              // content: const Text('Proceed with destructive action?'),
              actions: [
                CupertinoDialogAction(
                  // isDefaultAction: true,
                  onPressed: cameraPressed,
                  child: customOnlyText('Camera'),
                ),
                CupertinoDialogAction(
                  // isDestructiveAction: true,
                  onPressed: devicePressed,
                  child: customOnlyText('Device'),
                ),
              ],
            ),
          )
        : showCupertinoModalPopup<void>(
            context: context,
            builder: (BuildContext context) => CupertinoAlertDialog(
              title: customOnlyText('Choose From'),
              // content: const Text('Proceed with destructive action?'),
              actions: [
                CupertinoDialogAction(
                  // isDefaultAction: true,
                  onPressed: cameraPressed,
                  child: customOnlyText('Camera'),
                ),
                CupertinoDialogAction(
                  // isDestructiveAction: true,
                  onPressed: devicePressed,
                  child: customOnlyText('Device'),
                ),
              ],
            ),
          );
  }

  Future<bool> showExitPopup() async {
    return await showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: CurrentContext().context,
          builder: (context) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 3),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  color: Colors.white24,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 15),
                      customOnlyText("Hi!",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 15),
                      customOnlyText(
                          "Are you sure, you want to exit from the app?",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center),
                      const SizedBox(height: 22),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: customOnlyText("No"),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: customOnlyText(
                                  "Yes",
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ) ??
        false;
  }

/*  willPopShowAlertPopup(BuildContext context,
      {required String content,
      required String title,
      required void Function()? onPressedYes}) async {
    return await showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              color: Colors.white24,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(
                    height: 15,
                  ),
                  customText(title, black, 16),
                  const SizedBox(
                    height: 15,
                  ),
                  customText(content, black, 16),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: customOnlyText("No"),
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                              onPressed: onPressedYes,
                              child: customOnlyText(
                                "Yes",
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ))),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ) ??
        false;
  }*/

  /*/// ios app update
  showAppUpdateDialogue(BuildContext context,
      {required String title,
      required String content,
      required void Function()? onPressedOk,
      required void Function()? onPressedCancel,
      required void Function()? onPressedIgnore}) {
    return showCupertinoDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: customOnlyText(title),
              content: customOnlyText(content),
              actions: <Widget>[
                Visibility(
                  visible: !AppUpdate().isAppUpdateMandatory(),
                  child: CupertinoDialogAction(
                    onPressed: onPressedIgnore,
                    child: customOnlyText('Maybe Later'),
                  ),
                ),
                Visibility(
                  visible: AppUpdate().isAppUpdateMandatory(),
                  child: CupertinoDialogAction(
                    onPressed: onPressedCancel,
                    child: customOnlyText('Cancel'),
                  ),
                ),
                CupertinoDialogAction(
                  onPressed: onPressedOk,
                  child: customOnlyText('Update'),
                ),
              ],
            ));
  }*/

  /*Future<void> appUpdateCheck() async {
    try {
      String appUpdateTimeCheckKey = "app_update_time_check_string";
      SharedPreferences? prefs = await SharedPreferences.getInstance();
      String? appUpdateCheckTime = prefs.getString(appUpdateTimeCheckKey);
      bool timeDifferance = false;
      if (appUpdateCheckTime != null) {
        timeDifferance = DateTime.now()
                .difference(DateTime.parse(appUpdateCheckTime))
                .inHours >
            24;
      } else {
        timeDifferance = true;
      }
      final status = await NewVersionPlus(
              iOSAppStoreCountry: "IN", androidPlayStoreCountry: "en_IN")
          .getVersionStatus();
      String currentLiveVersion =
          "${await AppConfigPref().getConfigDataByKey("CurrentLiveVersion")}";
      String isAppUpdateMandatory =
          "${await AppConfigPref().getConfigDataByKey("IsAppUpdateMandatory")}";

      VersionStatus versionStatus = VersionStatus(
          localVersion: "${await RSConfig().getAppVersion()}",
          storeVersion: currentLiveVersion,
          appStoreLink: status?.appStoreLink ?? "",
          releaseNotes: status?.releaseNotes ?? "",
          originalStoreVersion: currentLiveVersion);

      bool data = versionStatus.canUpdate;

      AppLog().log('canUpdate $data');

      if (data && (timeDifferance || isAppUpdateMandatory == "Y")) {
        await prefs.setString(appUpdateTimeCheckKey, DateTime.now().toString());
        if (Platform.isIOS) {
          PopUpItems().showAppUpdateDialogue(
            CurrentContext().context,
            title: 'App Update',
            content: AppEnglishText().txt_app_update_mandetory,
            onPressedIgnore: () {
              Navigator.of(CurrentContext().context).pop();
            },
            onPressedCancel: () {
              isAppUpdateMandatory == "N"
                  ? CurrentContext().context.pop()
                  : FlutterExitApp.exitApp(iosForceExit: false);
            },
            onPressedOk: () {
              RSTextUtils().launchingUrl(status!.appStoreLink.toString());
            },
          );
        } else if (Platform.isAndroid) {
          isAppUpdateMandatory == "N"
              ? checkForFlexibleUpdateAndUpdate()
              : checkForImmediateUpdateAndUpdate();
        }
      }
    } catch (e) {
      AppLog().errLog(err: e.toString());
    }
  }*/

  /*Future<void> checkForFlexibleUpdateAndUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      if (info.updateAvailability == UpdateAvailability.updateAvailable) {
        InAppUpdate.startFlexibleUpdate().then((onValue) {}).catchError((e) {
          showSnack(e.toString());
        });
      }
    }).catchError((e) {
      AppLog().errLog(err: e.toString());
      showSnack(e.toString());
    });
  }*/

/*  Future<void> checkForImmediateUpdateAndUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      if (info.updateAvailability == UpdateAvailability.updateAvailable) {
        InAppUpdate.performImmediateUpdate().then((onValue) async {
          if (onValue == AppUpdateResult.userDeniedUpdate) {
            await SystemNavigator.pop();
          }
        }).catchError((e) {
          showSnack(e.toString());
        });
      }
    }).catchError((e) {
      AppLog().errLog(err: e.toString());
      showSnack(e.toString());
    });
  }*/

  void showSnack(String text) {
    ScaffoldMessenger.of(CurrentContext().context)
        .showSnackBar(SnackBar(content: customOnlyText(text)));
  }

/*  Future pendingEmailUpdatePopup(BuildContext context,
      {required dynamic Function()? onPressed,
      required String? Function(String?)? emilValidator,
      required TextEditingController pendingEmailController}) {
    return showModalBottomSheet(
        barrierColor: Colors.transparent,
        backgroundColor: Colors.white,
        elevation: 10,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        context: context,
        builder: (context) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                  left: 20,
                  right: 20,
                  top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  customText(AppEnglishText().pendingEmailValidation, red, 14),
                  customTextField(
                      validator: emilValidator,
                      onChanged: (val) {
                        return Validator().emailValidator(value: val);
                      },
                      hintText: AppEnglishText().email,
                      controller: pendingEmailController),
                  15.ph,
                  customButton(
                      width: MediaQuery.of(context).size.width,
                      buttonText: LocalizationKeys.submitBtnText.toUpperCase(),
                      onPressed: onPressed,
                      buttonTextSize: 12),
                  20.ph,
                ],
              ),
            ));
  }*/

  popUpAlertNoTitle(
      {required BuildContext context,
      required Function()? onPressedOk,
      bool? canPop,
      String content = "",
      String firstBtn = ""}) {
    showCupertinoDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => PopScope(
        canPop: canPop ?? true,
        child: CupertinoAlertDialog(
          content: customText(content, Colors.black, 16),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: onPressedOk,
              child: customText(firstBtn.isEmpty ? 'Ok' : firstBtn, black, 14),
            ),
          ],
        ),
      ),
    );
  }
}
