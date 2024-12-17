import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/view_model/arabic_series_view_model.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/widgets/arabic_series/see_all_arabic_series.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/widgets/popular_series/popular_series_item_widget.dart';
import 'package:movies_app/core/DI/di.dart';
import 'package:movies_app/core/reusable%20components/List_title_widget.dart';
import 'package:movies_app/domain/entities/series/TopRatedSeriesEntity.dart';

class ArabicSeriesWidgetBuilder extends StatelessWidget {
  const ArabicSeriesWidgetBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArabicSeriesViewModel>(
      create: (context) {
        if (ArabicSeriesViewModel.arabicSeries.isEmpty) {
          return getIt<ArabicSeriesViewModel>()..getArabicSeries(page: 1);
        }
        return getIt<ArabicSeriesViewModel>()..getArabicSeriesDirectly();
      },
      child: BlocBuilder<ArabicSeriesViewModel, ArabicSeriesViewModelStates>(
        builder: (context, state) {
          if (state is ArabicSeriesViewModelSuccessState) {
            return Column(
              children: [
                ListTitleWidget(
                  title: "Arabic Series",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => BlocProvider(
                          create: (context) => getIt<ArabicSeriesViewModel>()
                            ..getArabicSeries(page: 1),
                          child: const SeeAllArabicSeries(),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                PopularSeriesItemWidget(
                  topRatedSeriesEntityList: ArabicSeriesViewModel.arabicSeries
                      .map((e) => TopRatedSeriesEntity(
                          backdropPath: e.backdropPath,
                          id: e.id,
                          posterPath: e.posterPath,
                          firstAirDate: e.firstAirDate,
                          name: e.name))
                      .toList(),
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
