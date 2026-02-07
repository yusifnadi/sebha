

class CacheHelper {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance(); // هنا بيتخصص
  }

  static int getInt(String key) {
    return _prefs.getInt(key) ?? 0;
  }

  static Future<void> saveInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }
}

extension on SharedPreferences {
  getInt(String key) {}
  
  Future<void> setInt(String key, int value) async {}
}

class SharedPreferences {
  static Future<SharedPreferences> getInstance() async {
    return SharedPreferences();
  }
}
