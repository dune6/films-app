import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_event.dart';

part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationCategoriesState()) {
    on<NavigationToFilmsEvent>(
        (event, emit) => emit(NavigationFilmsState()));
    on<NavigationToCategoriesEvent>(
        (event, emit) => emit(NavigationCategoriesState()));
    on<NavigationToFavouritesEvent>(
        (event, emit) => emit(NavigationFavouritesState()));
    on<NavigationToUserEvent>((event, emit) => emit(NavigationUserState()));
  }
}
