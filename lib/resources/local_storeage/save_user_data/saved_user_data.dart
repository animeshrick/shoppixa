import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppixa/resources/local_storeage/save_user_data/user_model.dart';

import '../../../utils/logger.dart';

class SavedUserDataSp {
  static SharedPreferences? prefs;

  static final SavedUserDataSp networkCall = SavedUserDataSp._internal();

  SavedUserDataSp._internal();

  factory SavedUserDataSp() {
    return networkCall;
  }

  final userData = 'userData';

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> clearUser() async => await prefs?.remove(userData);

  void saveUser(User user) {
    Map<String, dynamic> userMap = {
      "UserTokoen": user.userToken,
      "UserId": user.userId,
      "EmailId": user.emailId,
      "MobileNo": user.mobileNumber,
      "FName": user.firstName,
      "LName": user.lastName,
      "UserName": user.userName,
      "Avatar": user.userAvatar,
      "ReferralCode": user.referralCode,
      "ActiveStatus": user.activeStatus,
      "IsPrimeUser": user.isPrimeUser,
      "DOB": user.dob,
    };
    AppLog.i("userMap $userMap");

    //var userJsonData = jsonEncode(user);
    var userJsonData = json.encode(userMap);
    AppLog.i("userJsonData $userJsonData");
    prefs?.setString(userData, userJsonData);
  }

  getSavedUser() {
    var userdata = prefs?.getString(userData);
    final Map _userData = json.decode(userdata.toString()) ?? {};

    AppLog.i("getSavedUser $userdata");
    User user = User();
    user.userId = _userData["UserId"].toString();
    user.emailId = _userData["EmailId"] ?? "";
    user.mobileNumber = _userData["MobileNo"] ?? "";
    user.firstName = _userData["FName"] ?? "";
    user.lastName = _userData["LName"] ?? "";
    user.referralCode = _userData["ReferralCode"] ?? "";
    user.activeStatus = _userData["ActiveStatus"] ?? "";
    user.dob = _userData["DOB"] ?? "";

    return user;
  }
}
