import 'package:film_searcher/features/movies/domain/film_model.dart';
import 'package:film_searcher/features/movies/screens/films.dart';
import 'package:film_searcher/features/movies/service/films_bloc/films_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'film_list_item.dart';

/// List of preview [Film]`s
class FilmListWidget extends StatefulWidget {
  final List<Film> films;

  const FilmListWidget({Key? key, required this.films}) : super(key: key);

  @override
  State<FilmListWidget> createState() => _FilmListWidgetState();
}

class _FilmListWidgetState extends State<FilmListWidget> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ScrollPhysics(),
      addAutomaticKeepAlives: true,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: widget.films.length,
      itemExtent: 296,
      scrollDirection: Axis.vertical,
      controller: _scrollController,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: FilmListItem(
            film: widget.films[index],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    final filmsScreen = context.findAncestorWidgetOfExactType<FilmsScreen>();
    if (_isBottom) {
      context
          .read<FilmsBloc>()
          .add(FilmsFetched(textFilter: filmsScreen?.text ?? ''));
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
