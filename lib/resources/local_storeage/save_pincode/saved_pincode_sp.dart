import 'package:shared_preferences/shared_preferences.dart';

class SavedPinCodeSp {
  final pinCode = 'pincode';

  Future<void> init() async {
    await SharedPreferences.getInstance();
  }

  Future<void> clearPinCode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(pinCode);
  }

  void savePinCode(String pinCde) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(pinCode, pinCde);
  }

  Future<String?> getSavedPinCode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? _pinCode = prefs.getString(pinCode);
    return _pinCode;
  }
}
