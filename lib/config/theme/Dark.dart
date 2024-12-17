import 'package:flutter/material.dart';
import 'package:movies_app/core/Utils/app_colors.dart';
import 'package:movies_app/core/Utils/texts_styles.dart';

class DarkTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      primary: AppColors.primaryColor,
      surface: AppColors.backgroundColor,
      onSurface: AppColors.horizontalScrollableAreaColor,
      primaryContainer: AppColors.movieCardWithDetailsColor,
      onPrimaryContainer: AppColors
          .unselectedBookmarkAndBoarderMovieCategoryAndFilledSearchTextFieldColor,
      secondary: AppColors.navigatorBarColor,
      onSecondary: AppColors.unselectedNavigatorBarIconColor,
      inversePrimary: AppColors.cursor,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      titleTextStyle: TextsStyles.appBarTitle,
      centerTitle: true,
    ),
    textTheme: TextTheme(
        displayLarge: TextsStyles
            .loginRegisterPrimeTitle, // for login and register yellow titles can use copyWith to control size and wight in same page
        displayMedium: TextsStyles
            .loginRegisterWhiteTitle, // for login and register white titles can use copyWith to control size and wight in same page
        bodyMedium: TextsStyles
            .movieDescription, // for movieDescription in movie details screen and movieCategoryInBorderTitle in same screen => resize it to 10
        headlineLarge: TextsStyles
            .mainMovieName, // for main movie name in home * movie details => resize it to 18 * any white title , search&Watchlist card => resize to 15 * in film card => resize it to 10
        labelMedium: TextsStyles
            .movieMiniDetails, // for year and PG film hours in home and movie details * in card resize it to 8
        labelSmall: TextsStyles
            .movieDetailsInSearchAndWatchListColor, // for search&Watchlist card Details
        titleSmall: TextsStyles.movieMiniDetails.copyWith(
            color: const Color(0xffDEDDDF)), // for movie rating in movie card
        titleMedium: TextsStyles.category,
        titleLarge: TextsStyles.seeAll),
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 12,
    ),
    filledButtonTheme: const FilledButtonThemeData(
        style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(AppColors.primaryColor),
      textStyle: WidgetStatePropertyAll(TextsStyles.filledButton),
      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 50)),
    )),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.navigatorBarColor,
      selectedIconTheme: IconThemeData(size: 25, color: AppColors.primaryColor),
      unselectedIconTheme: IconThemeData(
          size: 25, color: AppColors.unselectedNavigatorBarIconColor),
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.unselectedNavigatorBarIconColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextsStyles.selectedLabelInBottomNavigationBar,
      unselectedLabelStyle: TextsStyles.unselectedLabelInBottomNavigationBar,
    ),
  );
}
