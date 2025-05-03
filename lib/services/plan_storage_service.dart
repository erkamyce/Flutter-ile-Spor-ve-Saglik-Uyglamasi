import 'package:shared_preferences/shared_preferences.dart';

class PlanStorageService {
  static Future<List<bool>> loadChecklist(String key, int length) async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList(key);
    if (saved == null) {
      return List<bool>.filled(length, false);
    }
    return saved.map((e) => e == 'true').toList();
  }

  static Future<void> saveChecklist(String key, List<bool> checklist) async {
    final prefs = await SharedPreferences.getInstance();
    final asString = checklist.map((e) => e.toString()).toList();
    await prefs.setStringList(key, asString);
  }
}
