import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/view_model/popular_series_view_model.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/widgets/popular_series/popular_series_item_widget.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/widgets/popular_series/see_all_popular_series.dart';
import 'package:movies_app/core/DI/di.dart';
import 'package:movies_app/core/reusable%20components/List_title_widget.dart';

class PopularSeriesBuilder extends StatelessWidget {
  const PopularSeriesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PopularSeriesViewModel>(
      create: (context) {
        if (PopularSeriesViewModel.popularList.isEmpty) {
          return getIt<PopularSeriesViewModel>()..getPopular(page: 1);
        }
        return getIt<PopularSeriesViewModel>()..getPopularDirectly();
      },
      child: BlocBuilder<PopularSeriesViewModel, PopularSeriesStates>(
        builder: (context, state) {
          if (state is PopularSeriesSuccessState) {
            PopularSeriesViewModel.popularList = state.categories;
            return Column(
              children: [
                ListTitleWidget(
                  title: "Best Series",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => getIt<PopularSeriesViewModel>()
                            ..getPopular(page: 1),
                          child: const SeeAllPopularSeries(),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                PopularSeriesItemWidget(
                  topRatedSeriesEntityList: PopularSeriesViewModel.popularList,
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
