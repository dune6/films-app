import 'package:film_searcher/features/movies/domain/film_model.dart';
import 'package:flutter/material.dart';

import 'film_list_item.dart';

/// List of preview [Film]`s
class FilmListWidget extends StatefulWidget {
  final List<Film> films;

  const FilmListWidget({Key? key, required this.films}) : super(key: key);

  @override
  State<FilmListWidget> createState() => _FilmListWidgetState();
}

class _FilmListWidgetState extends State<FilmListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ScrollPhysics(),
      addAutomaticKeepAlives: true,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: widget.films.length,
      itemExtent: 296,
      scrollDirection: Axis.vertical,
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
}
