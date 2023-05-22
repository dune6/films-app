import 'package:dio/dio.dart';
import 'package:film_searcher/features/network/domain/response_entity.dart';
import 'package:surf_logger/surf_logger.dart';
import '../utils/http_helper.dart';

abstract class IApiService {
  Future<ResponseEntity> searchFilms(
      {required String searchText, required int page, required int limit});
}

class ApiService implements IApiService {
  // In a real project , I would use a file .env with link configuration
  static const String _endPoint = 'https://api.kinopoisk.dev';
  static const String _apiToken = 'PR9Z86W-29KMN8A-GVHMW0M-95SHYNC';

  /// Get random movie
  @override
  Future<ResponseEntity> searchFilms(
      {required String searchText,
      required int page,
      required int limit}) async {
    var query = {'page': page, 'limit': limit, 'query': searchText};
    var headers = {'X-API-KEY': _apiToken};
    Response response = await HttpHelper.get('$_endPoint/v1.2/movie/search',
        queryParams: query, headers: headers);
    Logger.d('Response code: ${response.statusCode}');
    if (response.statusCode == 200) {
      Logger.d(response.data.runtimeType.toString());
      return ResponseEntity.fromJson(response.data);
    }
    throw Exception('error fetching films');
  }
}
