import 'package:shared_preferences/shared_preferences.dart';

const String accessTokenKey="access";
const String refreshTokenKey="refesh";
class SharedService {
  SharedService._();

  static final SharedService _instance = SharedService._();

  static SharedService get instance => _instance;

  final SharedPreferencesAsync _prefs = SharedPreferencesAsync();

  Future<void> setData({required String key, String? value}) async {
    final newValue = value ?? "";
    if (newValue.isNotEmpty) {
      _prefs.setString(key, newValue);
    }
  }

  Future<String> getData({required String key}) async {
    return await _prefs.getString(key) ?? "";
  }

  Future<void> clearData({Set<String>? allowList}) async {
    return _prefs.clear(allowList: allowList);
  }
}
