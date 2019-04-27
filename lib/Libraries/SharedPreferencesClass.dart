import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  final String _kSortByUsagePrefs = "sortByUsage";
  final String _kShowFavoritesOnTopPrefs = "showFavoritesOnTop";

  Future<bool> getSortByUsage() async {
	  final SharedPreferences prefs = await SharedPreferences.getInstance();
  	return prefs.getBool(_kSortByUsagePrefs) ?? true;
  }

  Future<bool> getShowFavoritesOnTop() async {
	  final SharedPreferences prefs = await SharedPreferences.getInstance();
	  return prefs.getBool(_kShowFavoritesOnTopPrefs) ?? false;
  }

  setSortByUsage(bool value) async {
	  final SharedPreferences prefs = await SharedPreferences.getInstance();
	  prefs.setBool(_kSortByUsagePrefs, value);
  }

  setShowFavoritesOnTop(bool value) async {
	  final SharedPreferences prefs = await SharedPreferences.getInstance();
	  prefs.setBool(_kShowFavoritesOnTopPrefs, value);
  }
}