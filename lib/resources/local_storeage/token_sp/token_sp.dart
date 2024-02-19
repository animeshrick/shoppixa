import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppixa/utils/text_utils.dart';

class TokenSP {
  final refreshToken = 'refresh';
  final accessToken = 'access';

  Future<bool> isLoginUser() async {
    if (TextUtils().isTextNotEmptyOrNull(await getAccessToken())) {
      return true;
    } else if (TextUtils().isTextNotEmptyOrNull(await getRefreshToken())) {
      return true;
    } else {
      return false;
    }
    /*return TextUtils().isTextNotEmptyOrNull(
        await getAccessToken() ?? await getRefreshToken());*/
  }

  Future<void> init() async {
    await SharedPreferences.getInstance();
  }

  Future<void> clearTokens() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(refreshToken);
    await prefs.remove(accessToken);
  }

  Future<void> clearRefreshTokenSp() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(refreshToken);
  }

  void saveRefreshToken(String introScreenData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(refreshToken, introScreenData);
  }

  Future<String?> getRefreshToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? _refreshTokenData = prefs.getString(refreshToken);
    return _refreshTokenData;
  }

  Future<void> clearAccessTokenSp() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(accessToken);
  }

  void saveAccessToken(String introScreenData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(accessToken, introScreenData);
  }

  Future<String?> getAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? _accessTokenData = prefs.getString(accessToken);
    return _accessTokenData;
  }
}
