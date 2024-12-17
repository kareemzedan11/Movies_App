import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/view_model/popular_home_tab_view_model.dart';
import 'package:movies_app/core/reusable%20components/custom_see_more_app_bar.dart';
import 'package:movies_app/core/reusable%20components/custom_see_more_movie_widget_builder.dart';

class SeeAllpopular extends StatefulWidget {
  const SeeAllpopular({super.key});

  @override
  State<SeeAllpopular> createState() => _SeeAllpopularState();
}

class _SeeAllpopularState extends State<SeeAllpopular> {
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
          context.read<PopularHomeTabViewModel>().getPopular(page: page);
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
      appBar: customSeeMoreAppBar(context, appBarTitle: "Most Popular"),
      body: BlocBuilder<PopularHomeTabViewModel, PopularHomeTabStates>(
        builder: (context, state) {
          if (state is PopularHomeTabSuccessState) {
            isLoading = false;
          }

          if (state is PopularHomeTabErrorState) {
            isLoading = false;
            return Center(child: Text(state.error));
          }

          if (state is PopularHomeTabInitialState ||
              state is PopularHomeTabLoadingState &&
                  PopularHomeTabViewModel.popularList.isEmpty) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          return CustomSeeMoreMovieWidgetBuilder(
            scrollController: scrollController,
            itemCount: PopularHomeTabViewModel.popularList.length,
            movies: PopularHomeTabViewModel.popularList,
          );
        },
      ),
    );
  }
}
