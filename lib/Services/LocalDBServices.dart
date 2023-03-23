import 'package:shared_preferences/shared_preferences.dart';

class LocalDBServices {
  static Future<bool> saveUserId(String uid) async {
    final _instance = await SharedPreferences.getInstance();
    return await _instance.setString('uid', uid);
  }

  static Future<bool> markVerified(bool status) async {
    final _instance = await SharedPreferences.getInstance();
    return await _instance.setBool('verified', status);
  }

  static Future<bool?> getVerificationStatus() async {
    final _instance = await SharedPreferences.getInstance();
    return _instance.getBool('verified');
  }

  static Future<String?> getUserId() async {
    final _instance = await SharedPreferences.getInstance();
    return _instance.getString('uid');
  }

  static Future<bool> deleteUid() async {
    final _instance = await SharedPreferences.getInstance();
    return await _instance.remove('uid');
  }
}