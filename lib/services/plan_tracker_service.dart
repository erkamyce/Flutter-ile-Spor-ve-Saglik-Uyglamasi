import 'package:shared_preferences/shared_preferences.dart';

class PlanTrackerService {
  static const _lastCompletedDateKey = 'lastCompletedDate';
  static const _currentStreakKey = 'currentStreak';

  static Future<void> markPlanAsCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final lastDateString = prefs.getString(_lastCompletedDateKey);
    int streak = prefs.getInt(_currentStreakKey) ?? 0;

    if (lastDateString != null) {
      final lastDate = DateTime.parse(lastDateString);
      if (today.difference(lastDate).inDays == 1) {
        streak += 1;
      } else if (today.difference(lastDate).inDays > 1) {
        streak = 1;
      } else {
        return; // aynı gün tekrar yazmasın
      }
    } else {
      streak = 1;
    }

    await prefs.setString(_lastCompletedDateKey, today.toIso8601String());
    await prefs.setInt(_currentStreakKey, streak);
  }

  static Future<int> getStreak() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_currentStreakKey) ?? 0;
  }
}
