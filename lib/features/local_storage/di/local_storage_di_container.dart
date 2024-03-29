import 'package:film_searcher/features/local_storage/provider/shared_pref_provider.dart';
import 'package:film_searcher/features/local_storage/service/shared_pref_service.dart';

class LocalStorageDiContainer {
  final SharedPreferencesService _sharedPreferencesService =
      SharedPreferencesService();

  SharedPreferencesProvider preferencesProvider() => SharedPreferencesProvider(
      sharedPreferencesService: _sharedPreferencesService);
}
