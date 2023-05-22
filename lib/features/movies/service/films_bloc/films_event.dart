part of 'films_bloc.dart';

abstract class FilmsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FilmsFetched extends FilmsEvent {
  final String textFilter;

  FilmsFetched({required this.textFilter});
}

class FilmsSaveLocally extends FilmsEvent {
  final List<Film> films;

  FilmsSaveLocally({required this.films});
}

class FilmsLoadLocally extends FilmsEvent {}

class FilmsClearData extends FilmsEvent {}
