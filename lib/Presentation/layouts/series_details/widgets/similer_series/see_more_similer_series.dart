import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/layouts/series_details/widgets/similer_series/view_model/similer_series_view_model.dart';
import 'package:movies_app/core/DI/di.dart';
import 'package:movies_app/core/reusable%20components/custom_see_more_app_bar.dart';
import 'package:movies_app/core/reusable%20components/custom_see_more_series_widget_builder.dart';

class SeeAllSeriesSimiler extends StatefulWidget {
  const SeeAllSeriesSimiler({super.key, required this.seriesId});
  final int seriesId;

  @override
  State<SeeAllSeriesSimiler> createState() => _SeeAllSeriesSimilerState();
}

class _SeeAllSeriesSimilerState extends State<SeeAllSeriesSimiler> {
  int page = 1;
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
    getIt<SimilerSeriesViewModel>()
        .getSimiler(seriesId: widget.seriesId, page: page);
  }

  void _onScroll() {
    if (scrollController.position.atEdge &&
        scrollController.position.pixels != 0 &&
        !isLoading &&
        SimilerSeriesViewModel.hasMore) {
      setState(() {
        isLoading = true;
      });

      Future.delayed(const Duration(milliseconds: 300), () {
        if (scrollController.position.atEdge &&
            scrollController.position.pixels != 0 &&
            !isLoading &&
            SimilerSeriesViewModel.hasMore) {
          page++;
          getIt<SimilerSeriesViewModel>()
              .getSimiler(seriesId: widget.seriesId, page: page);
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
      body: BlocBuilder<SimilerSeriesViewModel, SimilerSeriesViewModelStates>(
        builder: (context, state) {
          if (state is SimilerSeriesViewModelLoadingState && page == 1) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          if (state is SimilerSeriesViewModelErrorState) {
            return Center(child: Text(state.error));
          }

          if (state is SimilerSeriesViewModelSuccessState ||
              state is SimilerSeriesViewModelLoadingMoreState) {
            isLoading = false;

            return Column(
              children: [
                Expanded(
                  child: CustomSeeMoreSeriesWidgetBuilder(
                    scrollController: scrollController,
                    itemCount: SimilerSeriesViewModel.similerSeries.length,
                    series: SimilerSeriesViewModel.similerSeries,
                  ),
                ),
                if (state is SimilerSeriesViewModelLoadingMoreState)
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
