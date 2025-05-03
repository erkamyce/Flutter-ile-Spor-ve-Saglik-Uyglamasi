import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static Future<void> updateUserData({
    double? boy,
    double? kilo,
    int? yas,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    if (boy != null) prefs.setDouble('boy', boy);
    if (kilo != null) prefs.setDouble('kilo', kilo);
    if (yas != null) prefs.setInt('yas', yas);
  }
  static Future<void> saveRegisterData({
    required String email,
    required String password,
    required double boy,
    required double kilo,
    required int yas,
  })

  async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
    prefs.setString('password', password);
    prefs.setDouble('boy', boy);
    prefs.setDouble('kilo', kilo);
    prefs.setInt('yas', yas);
    prefs.setBool('firstLogin', true);
  }

  static Future<bool> validateLogin(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('email');
    final savedPassword = prefs.getString('password');
    return email == savedEmail && password == savedPassword;
  }

  static Future<bool> isFirstLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('firstLogin') ?? true;
  }

  static Future<void> setFirstLoginFalse() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('firstLogin', false);
  }

  static Future<Map<String, dynamic>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'boy': prefs.getDouble('boy') ?? 0.0,
      'kilo': prefs.getDouble('kilo') ?? 0.0,
      'yas': prefs.getInt('yas') ?? 0,
    };
  }
}
