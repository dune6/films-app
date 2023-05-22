import 'package:film_searcher/features/app/films_app.dart';
import 'package:film_searcher/features/app/service/films_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_logger/surf_logger.dart';

import 'features/navigation/service/bloc/navigation_bloc.dart';

/// App launch
Future<void> run() async {
  _initLogger();
  Bloc.observer = const FilmsBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BlocProvider(
      create: (context) => NavigationBloc(), child: const FilmsApplication()));
}

void _initLogger() {
  Logger.addStrategy(DebugLogStrategy());
}
