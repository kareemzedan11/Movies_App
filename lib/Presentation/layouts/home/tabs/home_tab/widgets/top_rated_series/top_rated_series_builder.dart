import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/view_model/top_rated_series_view_model.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/widgets/top_rated_series/top_rated_series_Item_widget.dart';
import 'package:movies_app/core/DI/Di.dart';

class TopRatedSeriesBuilder extends StatelessWidget {
  const TopRatedSeriesBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        if (TopRatedSeriesViewModel.topRatedSeries.isEmpty) {
          return getIt<TopRatedSeriesViewModel>()..getTopRatedSeries();
        }
        return getIt<TopRatedSeriesViewModel>()..getTopRatedSeriesDirectly();
      },
      child: BlocBuilder<TopRatedSeriesViewModel, TopRatedSeriesStates>(
        builder: (context, state) {
          if (state is TopRatedSeriesSuccessState) {
            if (TopRatedSeriesViewModel.topRatedSeries.isEmpty) {
              TopRatedSeriesViewModel.topRatedSeries = state.topRated;
            }
            return Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: CarouselSlider.builder(
                  itemBuilder: (context, index, index2) =>
                      TopRatedSeriesItemWidget(
                        topRatedSeriesEntity:
                            TopRatedSeriesViewModel.topRatedSeries[index],
                      ),
                  itemCount: TopRatedSeriesViewModel.topRatedSeries.length,
                  options: CarouselOptions(
                    height: MediaQuery.sizeOf(context).height * 0.6,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.8,
                    autoPlayInterval: const Duration(seconds: 2),
                  )),
            );
          }
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.25,
          );
        },
      ),
    );
  }
}
