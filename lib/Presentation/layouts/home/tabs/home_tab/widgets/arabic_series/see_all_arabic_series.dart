import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/view_model/arabic_series_view_model.dart';
import 'package:movies_app/core/reusable%20components/custom_see_more_app_bar.dart';
import 'package:movies_app/core/reusable%20components/custom_see_more_series_widget_builder.dart';

class SeeAllArabicSeries extends StatefulWidget {
  const SeeAllArabicSeries({super.key});

  @override
  State<SeeAllArabicSeries> createState() => _SeeAllArabicSeriesState();
}

class _SeeAllArabicSeriesState extends State<SeeAllArabicSeries> {
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
          context.read<ArabicSeriesViewModel>().getArabicSeries(page: page);
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
      appBar: customSeeMoreAppBar(context, appBarTitle: "Arabic Series"),
      body: BlocBuilder<ArabicSeriesViewModel, ArabicSeriesViewModelStates>(
        builder: (context, state) {
          if (state is ArabicSeriesViewModelSuccessState) {
            isLoading = false;
          }

          if (state is ArabicSeriesViewModelErrorState) {
            isLoading = false;
            return Center(child: Text(state.error));
          }

          if (state is ArabicSeriesViewModelInitialState ||
              state is ArabicSeriesViewModelLoadingState &&
                  ArabicSeriesViewModel.arabicSeries.isEmpty) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          return CustomSeeMoreSeriesWidgetBuilder(
            scrollController: scrollController,
            itemCount: ArabicSeriesViewModel.arabicSeries.length,
            series: ArabicSeriesViewModel.arabicSeries,
            isArabicSeries: true,
          );
        },
      ),
    );
  }
}
