import 'package:flutter_svg/flutter_svg.dart';

abstract class AppIcons {
  // navigation
  static SvgPicture filmsUnselected = SvgPicture.asset(
      'assets/icons/navigation/unselected/navigation_articles.svg');
  static SvgPicture filmsSelected = SvgPicture.asset(
      'assets/icons/navigation/selected/navigation_articles.svg');
  static SvgPicture categoriesUnselected = SvgPicture.asset(
      'assets/icons/navigation/unselected/navigation_categories.svg');
  static SvgPicture categoriesSelected = SvgPicture.asset(
      'assets/icons/navigation/selected/navigation_categories.svg');
  static SvgPicture favouritesUnselected = SvgPicture.asset(
      'assets/icons/navigation/unselected/navigation_favourites.svg');
  static SvgPicture favouritesSelected = SvgPicture.asset(
      'assets/icons/navigation/selected/navigation_favourites.svg');
  static SvgPicture userUnselected = SvgPicture.asset(
      'assets/icons/navigation/unselected/navigation_user.svg');
  static SvgPicture userSelected =
      SvgPicture.asset('assets/icons/navigation/selected/navigation_user.svg');

  // home scaffold
  static SvgPicture search = SvgPicture.asset('assets/icons/home/search.svg');
  static SvgPicture microphone =
      SvgPicture.asset('assets/icons/home/microphone.svg');
  static SvgPicture share = SvgPicture.asset('assets/icons/home/share.svg');
}
