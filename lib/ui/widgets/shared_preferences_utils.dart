import 'package:shared_preferences/shared_preferences.dart';

class PreferencesKeys {
  static const String mostRecentSurahKay = "most_recent_surah_key";
  static const String isOnboardingCompletedKey = "is_onboarding_completed_key";
}

Future<void> updateMostRecentSurah(int index) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var savedIndices = await getMostRecentSurah();
  savedIndices.remove(index);
  savedIndices.insert(0, index);

  await prefs.setStringList(
    PreferencesKeys.mostRecentSurahKay,
    savedIndices.map((e) => e.toString()).toList(),
  );
}

Future<List<int>> getMostRecentSurah() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var mostRecentSurah = prefs.getStringList(PreferencesKeys.mostRecentSurahKay);
  var indices = mostRecentSurah?.map((e) => int.parse(e)).toList();
  return indices ?? [];
}

Future<void> setOnboardingCompleted(bool isCompleted) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool(PreferencesKeys.isOnboardingCompletedKey, isCompleted);
}

Future<bool> getOnboardingCompleted() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(PreferencesKeys.isOnboardingCompletedKey) ?? false;
}
