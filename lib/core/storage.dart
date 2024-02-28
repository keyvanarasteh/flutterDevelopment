import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  Future<bool> isFirstLaunch() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    final runned = storage.getBool("runned");

    if (runned == null) {
      return true;
    }
    return false;
  }

  firstLauched() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    await storage.setBool("runned", true);
  }

  clearStorage() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    storage.clear();
  }
}
