import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  Future<bool> isFirstLaunch() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    final runned = storage.getBool("runned");

    var counter = storage.getInt("launchCount");

    if (runned == null) {
      counter = 1;
      await storage.setInt("launchCount", 1);
      return true;
    } else {
      await storage.setInt("launchCount", counter! + 1);
      return false;
    }
  }

  firstLauched() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.setBool("runned", true);
  }

  // multi-language
  // dark mode light mode
  setSettings({
    String? language,
    bool? darkMode,
  }) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    if (language != null) {
      await storage.setString("language", language);
    }

    if (darkMode != null) {
      await storage.setBool("darkMode", darkMode);
    }
  }

  Future<Map<String, dynamic>> getSettings() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    final settings = {
      "language": storage.getString("language"),
      "darkMode": storage.getBool("darkMode"),
    };

    return settings;
  }

  // client data
  userLogin({
    String? name,
    String? email,
    String? token,
  }) async {}

  userLogout() async {}

  clearStorage() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.clear();
  }
}
