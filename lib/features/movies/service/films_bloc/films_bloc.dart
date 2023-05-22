import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:film_searcher/features/local_storage/provider/shared_pref_provider.dart';
import 'package:film_searcher/features/movies/domain/film_model.dart';
import 'package:film_searcher/features/movies/service/repository/films_repository.dart';
import 'package:surf_logger/surf_logger.dart';
import 'package:stream_transform/stream_transform.dart';

part 'films_event.dart';

part 'films_state.dart';

const throttleDuration = Duration(milliseconds: 200);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  Logger.d('transformer!');
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

/// ViewModel for Films, depends by [FilmsRepository] and [SharedPreferencesProvider]
class FilmsBloc extends Bloc<FilmsEvent, FilmsState> {
  final FilmsRepository filmsRepository;
  final SharedPreferencesProvider preferencesProvider;

  FilmsBloc({required this.filmsRepository, required this.preferencesProvider})
      : super(const FilmsState()) {
    on<FilmsFetched>(
      _onFilmsFetched,
      transformer: throttleDroppable(throttleDuration),
    );
    on<FilmsSaveLocally>(_saveFilmsLocally);
    on<FilmsLoadLocally>(_giveFilmsLocally);
    on<FilmsClearData>(_clearData);
  }

  void _clearData(FilmsClearData event, Emitter emit) {
    emit(const FilmsState(
        page: 1, status: FilmsStatus.initial, films: [], hasReachedMax: false));
  }

  Future<void> _onFilmsFetched(
      FilmsFetched event, Emitter<FilmsState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == FilmsStatus.initial) {
        final responseEntity =
            await filmsRepository.searchFilms(event.textFilter);
        return emit(state.copyWith(
          status: FilmsStatus.success,
          films: responseEntity.docs,
          hasReachedMax: false,
        ));
      }

      int page = state.page;
      // load films
      final responseEntity =
          await filmsRepository.searchFilms(event.textFilter, page + 1);
      // save locally loaded films
      await preferencesProvider.saveFilms(responseEntity.docs ?? []);

      emit(responseEntity.docs!.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: FilmsStatus.success,
              films: List.of(state.films)..addAll(responseEntity.docs ?? []),
              hasReachedMax: false,
              page: responseEntity.page));
    } catch (_) {
      emit(state.copyWith(status: FilmsStatus.failure));
    }
  }

  Future<void> _saveFilmsLocally(
      FilmsSaveLocally event, Emitter<FilmsState> emit) async {
    try {
      await preferencesProvider.saveFilms(event.films);
    } catch (e) {
      Logger.e(e.toString());
      rethrow;
    }
  }

  Future<void> _giveFilmsLocally(
      FilmsLoadLocally event, Emitter<FilmsState> emit) async {
    try {
      emit(state.copyWith(status: FilmsStatus.initial));
      final loaded = await preferencesProvider.getFilms();
      if (loaded?.isNotEmpty ?? false) {
        emit(state.copyWith(
          status: FilmsStatus.success,
          films: loaded!,
        ));
      } else {
        emit(state.copyWith(
          status: FilmsStatus.failure,
        ));
      }
    } catch (e) {
      Logger.e(e.toString());
      rethrow;
    }
  }
}
