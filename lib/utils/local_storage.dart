import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  Future<void> setBool({required String index, required bool value}) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setBool(index, value);
  }
   Future<bool?> getBool({required String index}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(index);
  }
}