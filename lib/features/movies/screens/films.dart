import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:film_searcher/features/app/util/colors.dart';
import 'package:film_searcher/features/app/util/icons.dart';
import 'package:film_searcher/features/movies/service/films_bloc/films_bloc.dart';
import 'package:film_searcher/features/movies/widgets/film_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_logger/surf_logger.dart';

class FilmsScreen extends StatefulWidget {
  const FilmsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FilmsScreen> createState() => _FilmsScreenState();
}

class _FilmsScreenState extends State<FilmsScreen> {
  final TextEditingController textEditingController = TextEditingController();
  late StreamSubscription<ConnectivityResult> _subscription;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    textEditingController.addListener(_filterFilms);
    _scrollController.addListener(_onScroll);

    // watch connection
    _subscription =
        Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);

    // init connection for films
    initConnectivity();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await Connectivity().checkConnectivity();
    } on PlatformException catch (e) {
      Logger.e('Couldn\'t check connectivity status ', e);
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.none:
        Logger.d('Connection is ${result.name}');
        context.read<FilmsBloc>().add(FilmsLoadLocally());
        break;
      default:
        Logger.d('Connection is ${result.name}');
        context
            .read<FilmsBloc>()
            .add(FilmsFetched(textFilter: textEditingController.text));
        break;
    }
  }

  @override
  void dispose() {
    _subscription.cancel();
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: _scrollController,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: [
        const SizedBox(
          height: 72,
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 19),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Browse',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Text(
                    'Discover things of this world',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  TextFormField(
                    onTap: () => {},
                    controller: textEditingController,
                    style: Theme.of(context).textTheme.labelMedium,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none),
                      hintText: 'Search',
                      fillColor: AppColors.greyLighter,
                      filled: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 12),
                        child: AppIcons.search,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 12),
                        child: AppIcons.microphone,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 19),
                child: BlocBuilder<FilmsBloc, FilmsState>(
                  builder: (context, state) {
                    switch (state.status) {
                      case FilmsStatus.initial:
                        return const CircularProgressIndicator();
                      case FilmsStatus.failure:
                        return const Text('Error!');
                      case FilmsStatus.success:
                        return state.films.isEmpty
                            ? const Text('No data')
                            : FilmListWidget(
                                films: state.films,
                              );
                    }
                  },
                )),
          ],
        )
      ],
    );
  }

  // filter films by text input
  void _filterFilms() {
    Logger.d(textEditingController.text);
    Logger.d(context.read<FilmsBloc>().state.page.toString());
    context.read<FilmsBloc>().add(FilmsClearData());
    context
        .read<FilmsBloc>()
        .add(FilmsFetched(textFilter: textEditingController.text));
  }

  void _onScroll() {
    if (_isBottom) {
      context
          .read<FilmsBloc>()
          .add(FilmsFetched(textFilter: textEditingController.text));
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
