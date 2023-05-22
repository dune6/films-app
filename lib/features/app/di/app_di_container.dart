import 'package:film_searcher/features/local_storage/di/local_storage_di_container.dart';
import 'package:film_searcher/features/movies/di/films_di_container.dart';

class AppDiContainer {
  final FilmsDiContainer filmsDiContainer = FilmsDiContainer();
  final LocalStorageDiContainer localStorageDiContainer =
      LocalStorageDiContainer();

  getFilmsRepository() => filmsDiContainer.filmsRepository();

  getLocalStorageRepository() => localStorageDiContainer.preferencesProvider();
}
