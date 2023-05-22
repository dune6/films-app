import 'package:film_searcher/features/movies/domain/film_model.dart';
import 'package:film_searcher/features/network/domain/response_entity.dart';
import 'package:film_searcher/features/network/service/api_service.dart';
import 'package:surf_logger/surf_logger.dart';

/// Repository interface for working with Films.
abstract class IFilmsRepository {
  Future<ResponseEntity> searchFilms(String searchText);
}

/// Repository for working with a films by using [ApiService].
class FilmsRepository implements IFilmsRepository {
  final ApiService apiService;

  FilmsRepository({required this.apiService});

  @override
  Future<ResponseEntity> searchFilms(String searchText,
      [int page = 1, int limit = 10]) async {
    try {
      return await apiService.searchFilms(
          searchText: searchText, page: page, limit: limit);
    } catch (e) {
      Logger.e(e.toString());
      rethrow;
    }
  }
}
