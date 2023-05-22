part of 'films_bloc.dart';

enum FilmsStatus { initial, success, failure }

class FilmsState extends Equatable {
  const FilmsState({
    this.status = FilmsStatus.initial,
    this.films = const <Film>[],
    this.hasReachedMax = false,
    this.page = 1,
  });

  final FilmsStatus status;
  final List<Film> films;
  final int page;
  final bool hasReachedMax;

  FilmsState copyWith({
    FilmsStatus? status,
    List<Film>? films,
    int? page,
    bool? hasReachedMax,
  }) {
    return FilmsState(
      status: status ?? this.status,
      films: films ?? this.films,
      page: page ?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''FilmsState { status: $status, Films: ${films.length}, hasReachedMax: $hasReachedMax}''';
  }

  @override
  List<Object> get props => [status, films, hasReachedMax];
}
