import 'package:flutter/cupertino.dart';

import '../auth_repo/auth_repo.dart';

class AuthVm with ChangeNotifier {
  AuthenticationRepo authRepo = AuthenticationRepo();


  /// --------------- API Call register ---------------

  bool _isRegisterLoading = false;

  bool get registerLoading => _isRegisterLoading;

  setRegisterLoading(bool value) {
    _isRegisterLoading = value;
    notifyListeners();
  }

  ApiResponse<String> registerData = ApiResponse.loading();

  setReturnEligibility(ApiResponse<String> response) {
    registerData = response;
    notifyListeners();
  }

  /// User Register
  Future<void> registerAPICallVm() async {
    // firebaseAnalyticsCall();
    await _myRepo.registerApi(data: {
      /*"email": registerEmail.text.toString(),
      "password": registerPassword.text.toString(),
      "conf_password": registerConfPassword.text.toString(),
      "userID": await GetLocalUserData().userFID()*/
    }).then((value) async {
     /* setRegisterLoading(false);
      if (Modifiers().isTextNotEmptyOrNull(value)) {
        setReturnEligibility(ApiResponse.completed(value));
        bool registerFromFirebase = await FirebaseAuthServices().registerUser(
            registerEmail: registerEmail.text.toString(),
            registerPassword: registerPassword.text.toString());
        if (registerFromFirebase) {
          var context = NavigationService.navigatorKey.currentContext!;
          Navigator.of(context).pushNamed(MyRoutes.shortRegistration);
        }
      }*/
    }).onError((error, stackTrace) {
     /* setRegisterLoading(true);
      setReturnEligibility(ApiResponse.error(error.toString()));
      PopUpItems().toastMessage('registerAPICallVm message', red);*/
    });
}