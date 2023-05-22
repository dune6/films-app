part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent {}

class NavigationToFilmsEvent extends NavigationEvent {}

class NavigationToCategoriesEvent extends NavigationEvent {}

class NavigationToFavouritesEvent extends NavigationEvent {}

class NavigationToUserEvent extends NavigationEvent {}

enum NavPages { films, categories, favourites, user }

extension NavPagesExtension on NavPages {
  NavigationEvent get getEvent {
    switch (this) {
      case NavPages.films:
        return NavigationToFilmsEvent();
      case NavPages.categories:
        return NavigationToCategoriesEvent();
      case NavPages.favourites:
        return NavigationToFavouritesEvent();
      case NavPages.user:
        return NavigationToUserEvent();
    }
  }
}
