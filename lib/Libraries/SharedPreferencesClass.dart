import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  final String _sortByUsagePrefs = "sortByUsage";
  final String _showFavoritesOnTopPrefs = "showFavoritesOnTop";
  final String _emoticonsStatePrefs = "emoticonsState";

  Future<bool> getSortByUsage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_sortByUsagePrefs) ?? true;
  }

  Future<bool> getShowFavoritesOnTop() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_showFavoritesOnTopPrefs) ?? false;
  }

  Future<List<String>> getEmoticonsState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_emoticonsStatePrefs) ?? [];
  }

  setSortByUsage(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_sortByUsagePrefs, value);
  }

  setShowFavoritesOnTop(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_showFavoritesOnTopPrefs, value);
  }

  saveEmoticonsState(List<String> emoState) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(_emoticonsStatePrefs, emoState);
    //print ("Update complete");
  }
}
