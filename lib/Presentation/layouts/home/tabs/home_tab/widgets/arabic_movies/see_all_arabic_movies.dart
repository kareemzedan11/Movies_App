import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/view_model/arabic_movie_view_model.dart';
import 'package:movies_app/core/reusable%20components/custom_see_more_app_bar.dart';
import 'package:movies_app/core/reusable%20components/custom_see_more_movie_widget_builder.dart';

class SeeAllArabicMovies extends StatefulWidget {
  const SeeAllArabicMovies({super.key});

  @override
  State<SeeAllArabicMovies> createState() => _SeeAllArabicMoviesState();
}

class _SeeAllArabicMoviesState extends State<SeeAllArabicMovies> {
  int page = 1;
  ScrollController scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(
      () {
        if (scrollController.position.atEdge &&
            scrollController.position.pixels != 0 &&
            !isLoading) {
          setState(() {
            isLoading = true;
          });

          ++page;
          context.read<ArabicMovieViewModel>().getArabicMovies(page: page);
        }
      },
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customSeeMoreAppBar(context, appBarTitle: "Arabic Movies"),
      body: BlocBuilder<ArabicMovieViewModel, ArabicMovieViewModelStates>(
        builder: (context, state) {
          if (state is ArabicMovieViewModelSuccessState) {
            isLoading = false;
          }

          if (state is ArabicMovieViewModelErrorState) {
            isLoading = false;
            return Center(child: Text(state.error));
          }

          if (state is ArabicMovieViewModelInitialState ||
              state is ArabicMovieViewModelLoadingState &&
                  ArabicMovieViewModel.arabicMovies.isEmpty) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          return CustomSeeMoreMovieWidgetBuilder(
            scrollController: scrollController,
            itemCount: ArabicMovieViewModel.arabicMovies.length,
            movies: ArabicMovieViewModel.arabicMovies,
          );
        },
      ),
    );
  }
}
