import 'package:film_searcher/features/movies/service/repository/films_repository.dart';
import 'package:film_searcher/features/network/service/api_service.dart';

class FilmsDiContainer {
  final ApiService _apiService = ApiService();

  FilmsRepository filmsRepository() =>
      FilmsRepository(apiService: _apiService);
}
