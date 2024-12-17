import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/layouts/movie_details/view_model/similer_view_model.dart';
import 'package:movies_app/core/DI/di.dart';
import 'package:movies_app/core/reusable%20components/custom_see_more_app_bar.dart';
import 'package:movies_app/core/reusable%20components/custom_see_more_movie_widget_builder.dart';

class SeeAllSimiler extends StatefulWidget {
  const SeeAllSimiler({super.key, required this.movieId});
  final int movieId;

  @override
  State<SeeAllSimiler> createState() => _SeeAllSimilerState();
}

class _SeeAllSimilerState extends State<SeeAllSimiler> {
  int page = 1;
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
    getIt<SimilerHomeTabViewModel>().getSimiler(movieId: widget.movieId, page: page);
  }

  void _onScroll() {
    if (scrollController.position.atEdge &&
        scrollController.position.pixels != 0 &&
        !isLoading &&
        SimilerHomeTabViewModel.hasMore) {
      setState(() {
        isLoading = true;
      });

      Future.delayed(const Duration(milliseconds: 300), () {
        if (scrollController.position.atEdge &&
            scrollController.position.pixels != 0 &&
            !isLoading &&
            SimilerHomeTabViewModel.hasMore) {
          page++;
          getIt<SimilerHomeTabViewModel>()
              .getSimiler(movieId: widget.movieId, page: page);
        }
      });
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customSeeMoreAppBar(context, appBarTitle: "More like this"),
      body: BlocBuilder<SimilerHomeTabViewModel, SimilerHomeTabStates>(
        builder: (context, state) {
          if (state is SimilerHomeTabLoadingState) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          if (state is SimilerHomeTabErrorState) {
            return Center(child: Text(state.error));
          }

          if (state is SimilerHomeTabSuccessState ||
              state is SimilerHomeTabLoadingMoreState) {
            isLoading = false;

            return Column(
              children: [
                Expanded(
                  child: CustomSeeMoreMovieWidgetBuilder(
                    scrollController: scrollController,
                    itemCount: SimilerHomeTabViewModel.similerList.length,
                    movies: SimilerHomeTabViewModel.similerList,
                  ),
                ),
                if (state is SimilerHomeTabLoadingMoreState)
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator.adaptive(),
                  ),
              ],
            );
          }

          return const Center(child: Text("Unexpected State"));
        },
      ),
    );
  }
}
