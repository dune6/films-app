import 'package:bloc/bloc.dart';
import 'package:surf_logger/surf_logger.dart';

class FilmsBlocObserver extends BlocObserver {
  const FilmsBlocObserver();

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    Logger.d(transition.toString());
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    Logger.d(error.toString());
    super.onError(bloc, error, stackTrace);
  }
}
