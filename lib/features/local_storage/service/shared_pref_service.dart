import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_logger/surf_logger.dart';

abstract class ISharedPreferencesService {
  static const String keyFilms = 'films';

  Future<void> saveFilms(String filmsListJson);

  Future<String?> getFilms();
}

/// Service for save and get values for local db based on [SharedPreferences]
class SharedPreferencesService implements ISharedPreferencesService {
  @override
  Future<void> saveFilms(String filmsJson) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(ISharedPreferencesService.keyFilms, filmsJson);
      Logger.d('Films has been saved');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String?> getFilms() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(ISharedPreferencesService.keyFilms);
    } catch (e) {
      rethrow;
    }
  }
}
