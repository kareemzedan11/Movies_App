import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/view_model/popular_series_view_model.dart';
import 'package:movies_app/core/reusable%20components/custom_see_more_app_bar.dart';
import 'package:movies_app/core/reusable%20components/custom_see_more_series_widget_builder.dart';

class SeeAllPopularSeries extends StatefulWidget {
  const SeeAllPopularSeries({super.key});

  @override
  State<SeeAllPopularSeries> createState() => _SeeAllPopularSeriesState();
}

class _SeeAllPopularSeriesState extends State<SeeAllPopularSeries> {
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
          context.read<PopularSeriesViewModel>().getPopular(page: page);
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
      body: BlocBuilder<PopularSeriesViewModel, PopularSeriesStates>(
        builder: (context, state) {
          if (state is PopularSeriesSuccessState) {
            isLoading = false;
          }

          if (state is PopularSeriesErrorState) {
            isLoading = false;
            return Center(child: Text(state.error));
          }

          if (state is PopularSeriesInitialState ||
              state is PopularSeriesLoadingState &&
                  PopularSeriesViewModel.popularList.isEmpty) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          return CustomSeeMoreSeriesWidgetBuilder(
              scrollController: scrollController,
              itemCount: PopularSeriesViewModel.popularList.length,
              series: PopularSeriesViewModel.popularList);
        },
      ),
    );
  }
}
