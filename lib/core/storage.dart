import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  Future<bool> isFirstLaunch() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? launched = prefs.getBool('launched');

    if (launched == null) {
      return true;
    } else {
      return false;
    }
  }

  launched() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("launched", true);
  }
}
