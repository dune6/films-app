import 'dart:convert';

import 'package:film_searcher/features/local_storage/service/shared_pref_service.dart';
import 'package:film_searcher/features/movies/domain/film_model.dart';
import 'package:surf_logger/surf_logger.dart';

abstract class ISharedPreferencesProvider {
  Future<void> saveFilms(List<Film> films);

  Future<List<Film>?> getFilms();
}

/// Repository for communicating service layer [SharedPreferencesService]
class SharedPreferencesProvider implements ISharedPreferencesProvider {
  final SharedPreferencesService sharedPreferencesService;

  SharedPreferencesProvider({required this.sharedPreferencesService});

  // save last 100 searched
  @override
  Future<void> saveFilms(List<Film> films) async {
    try {
      List<Film> filmsToSave = [];
      if (films.length >= 100) {
        filmsToSave.addAll(films.sublist(films.length - 100));
      } else {
        List<Film>? downloaded = await getFilms();
        if (downloaded != null) {
          if (downloaded.length + films.length <= 100) {
            filmsToSave.addAll(films.reversed);
            filmsToSave.addAll(downloaded.reversed);
          } else {
            filmsToSave.addAll(films.reversed);
            filmsToSave.addAll(downloaded
                .sublist(downloaded.length - (100 - films.length))
                .reversed);
          }
        } else {
          if (films.length >= 100) {
            filmsToSave.addAll(films.sublist(films.length - 100).reversed);
          } else {
            filmsToSave.addAll(films.reversed);
          }
        }
      }

      String json =
          jsonEncode(filmsToSave.map((film) => film.toJson()).toList())
              .toString();
      Logger.d('Encoded json: $json');
      await sharedPreferencesService.saveFilms(json);
    } catch (e) {
      rethrow;
    }
  }

  // get saved locally films
  @override
  Future<List<Film>?> getFilms() async {
    try {
      String data = await sharedPreferencesService.getFilms() ?? '';
      Logger.d('Loaded json: $data');
      if (data == '') {
        return null;
      } else {
        return (jsonDecode(data) as List<dynamic>)
            .map((e) => Film.fromJson(e))
            .toList();
      }
    } catch (e) {
      rethrow;
    }
  }
}
