import 'package:cached_network_image/cached_network_image.dart';
import 'package:film_searcher/features/app/util/icons.dart';
import 'package:film_searcher/features/movies/domain/film_model.dart';
import 'package:film_searcher/features/movies/screens/film_info.dart';
import 'package:flutter/material.dart';

/// Element of [ListView.builder]
class FilmListItem extends StatelessWidget {
  final Film film;

  const FilmListItem({Key? key, required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Material(
            child: InkWell(
              onTap: () => Future.delayed(Duration.zero, () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FilmInfoScreen(
                      film: film,
                    ),
                  ),
                );
              }),
              child: SizedBox(
                height: 272,
                width: MediaQuery.of(context).size.width,
                child: CachedNetworkImage(
                  placeholder: (context, url) => Image.asset(
                      'assets/images/placeholder.png',
                      fit: BoxFit.fitWidth),
                  errorWidget: (context, url, error) {
                    return Image.asset('assets/images/placeholder.png',
                        fit: BoxFit.fitWidth);
                  },
                  placeholderFadeInDuration: const Duration(seconds: 1),
                  fadeInDuration: const Duration(seconds: 1),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                  imageUrl: film.poster ?? film.poster ?? film.backdrop ?? '',
                ),
              ),
            ),
          ),
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () =>
                                  Future.delayed(Duration.zero, () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FilmInfoScreen(
                                      film: film,
                                    ),
                                  ),
                                );
                              }),
                              child: Text(
                                film.name ?? 'Empty name',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ))),
                    IconButton(
                      onPressed: () {},
                      icon: AppIcons.favouritesUnselected,
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
