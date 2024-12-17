import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/search_feature/view_model/search_view_model.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/search_feature/widgets/search_body.dart';
import 'package:movies_app/config/theme/Dark.dart';
import 'package:movies_app/core/Utils/texts_styles.dart';

class SearchScreen extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: IconButton(
          onPressed: () {
           showResults(context);
          },
          icon: SvgPicture.asset(
            "assets/Icons/search.svg",
            colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primary, BlendMode.srcIn),
          ),
          style: const ButtonStyle(enableFeedback: false),
        ),
      ),
    ];
  }

  @override
  TextStyle? get searchFieldStyle =>
      TextsStyles.mainMovieName.copyWith(fontSize: 18);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return DarkTheme.darkTheme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.purple[900],
        toolbarTextStyle:
            Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 18),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: Theme.of(context)
            .textTheme
            .labelSmall
            ?.copyWith(color: Colors.white60),
        border: InputBorder.none,
      ),
    );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: SvgPicture.asset(
        "assets/Icons/arrow_back.svg",
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
      style: const ButtonStyle(enableFeedback: false),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SearchBody();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text(
        'Search for a movie or tv series',
        style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 18,
            fontWeight: FontWeight.w400),
      ),
    );
  }

  @override
  void showResults(BuildContext context) {
    SearchTabViewModel.getObject(context).search(movieName: query);
    super.showResults(context);
  }

  @override
  void showSuggestions(BuildContext context) {
    // Optional: Customize what happens when showing suggestions
    super.showSuggestions(context);
  }
}
