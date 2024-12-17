import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/view_model/last_updated_view_model.dart';
import 'package:movies_app/core/reusable%20components/custom_see_more_app_bar.dart';
import 'package:movies_app/core/reusable%20components/custom_see_more_movie_widget_builder.dart';

class SeeAllLastUpdated extends StatefulWidget {
  const SeeAllLastUpdated({super.key});

  @override
  State<SeeAllLastUpdated> createState() => _SeeAllLastUpdatedState();
}

class _SeeAllLastUpdatedState extends State<SeeAllLastUpdated> {
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
          context.read<LastUpdatedViewModel>().getlastUpdatedMovies(page: page);
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
      appBar: customSeeMoreAppBar(context, appBarTitle: "Last Updated"),
      body: BlocBuilder<LastUpdatedViewModel, LastUpdatedViewModelState>(
        builder: (context, state) {
          if (state is LastUpdatedViewModelSuccess) {
            isLoading = false;
          }

          if (state is LastUpdatedViewModelError) {
            isLoading = false;
            return Center(child: Text(state.errorMassage));
          }

          if (state is LastUpdatedViewModelInitial ||
              state is LastUpdatedViewModelLoaded &&
                  LastUpdatedViewModel.lastUpdatedList.isEmpty) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          return CustomSeeMoreMovieWidgetBuilder(
            scrollController: scrollController,
            itemCount: LastUpdatedViewModel.lastUpdatedList.length,
            movies: LastUpdatedViewModel.lastUpdatedList,
          );
        },
      ),
    );
  }
}
