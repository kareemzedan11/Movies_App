import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/view_model/arabic_movie_view_model.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/widgets/arabic_movies/see_all_arabic_movies.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/widgets/popular/popular_item_widget.dart';
import 'package:movies_app/core/DI/di.dart';
import 'package:movies_app/core/reusable%20components/List_title_widget.dart';
import 'package:movies_app/domain/entities/movies/PopularEntitie.dart';

class ArabicMoviesWidgetBuilder extends StatelessWidget {
  const ArabicMoviesWidgetBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArabicMovieViewModel>(
      create: (context) {
        if (ArabicMovieViewModel.arabicMovies.isEmpty) {
          return getIt<ArabicMovieViewModel>()..getArabicMovies(page: 1);
        }
        return getIt<ArabicMovieViewModel>()..getArabicMoviesDirectly();
      },
      child: BlocBuilder<ArabicMovieViewModel, ArabicMovieViewModelStates>(
        builder: (context, state) {
          if (state is ArabicMovieViewModelSuccessState) {
            return Column(
              children: [
                ListTitleWidget(
                  title: "Arabic Movies",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => BlocProvider(
                          create: (context) => getIt<ArabicMovieViewModel>()
                            ..getArabicMovies(page: 1),
                          child: const SeeAllArabicMovies(),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                PopularItemWidget(
                    popularList: ArabicMovieViewModel.arabicMovies
                        .map((e) => PopularEntitie(
                            adult: e.adult,
                            backdropPath: e.backdropPath,
                            id: e.id,
                            posterPath: e.posterPath,
                            releaseDate: e.releaseDate,
                            title: e.title))
                        .toList()),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
