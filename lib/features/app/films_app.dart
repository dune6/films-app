import 'package:film_searcher/features/app/pages/home_screen.dart';
import 'package:film_searcher/features/app/util/colors.dart';
import 'package:film_searcher/features/navigation/service/bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilmsApplication extends StatelessWidget {
  const FilmsApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ilya.voznesensky/news-app',
      theme: themeNewsApp,
      routes: {
        '/': (context) => BlocBuilder<NavigationBloc, NavigationState>(
              builder: (context, state) {
                return const HomeScreen();
              },
            ),
      },
      initialRoute: '/',
    );
  }
}

ThemeData themeNewsApp = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.purplePrimary,
    dividerColor: Colors.transparent,
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.purplePrimary,
        onPrimary: AppColors.purpleLighter,
        secondary: AppColors.purpleLight,
        onSecondary: AppColors.white,
        error: Colors.red,
        onError: AppColors.white,
        background: AppColors.greyLighter,
        onBackground: AppColors.white,
        surface: AppColors.greyLight,
        onSurface: AppColors.white),
    fontFamily: 'SF Pro',
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          color: AppColors.blackPrimary,
          fontSize: 24,
          fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(
          color: AppColors.blackPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600),
      bodySmall: TextStyle(
          color: AppColors.greyPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w400),
      titleLarge: TextStyle(
          color: AppColors.white,
          fontSize: 16, fontWeight: FontWeight.w700),
      titleMedium: TextStyle(
          color: AppColors.blackPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w600),
      displaySmall: TextStyle(
          color: AppColors.greyPrimary,
          fontSize: 12,
          fontWeight: FontWeight.w600),
      titleSmall: TextStyle(
          color: AppColors.white, fontSize: 12, fontWeight: FontWeight.w600),
      labelMedium: TextStyle(
          color: AppColors.greyPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w500),
    ));
