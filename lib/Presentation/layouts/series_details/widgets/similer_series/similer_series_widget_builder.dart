import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/layouts/movie_details/widgets/movie_trailler/thriller_widget.dart';
import 'package:movies_app/Presentation/layouts/series_details/widgets/similer_series/see_more_similer_series.dart';
import 'package:movies_app/Presentation/layouts/series_details/widgets/similer_series/view_model/similer_series_view_model.dart';
import 'package:movies_app/core/DI/Di.dart';
import 'package:movies_app/core/reusable%20components/List_title_widget.dart';
import 'package:movies_app/core/reusable%20components/series_card.dart';

class SimilerSeriesWidgetBuilder extends StatelessWidget {
  const SimilerSeriesWidgetBuilder({super.key, required this.seriesId});
  final num seriesId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SimilerSeriesViewModel>()
        ..getSimiler(seriesId: seriesId, page: 1),
      child: BlocBuilder<SimilerSeriesViewModel, SimilerSeriesViewModelStates>(
        builder: (context, state) {
          if (state is SimilerSeriesViewModelSuccessState) {
            SimilerSeriesViewModel.similerSeries = state.similer;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                ListTitleWidget(
                  title: "More Like This",
                  onTap: () {
                    youTubecontroller.pause();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => getIt<SimilerSeriesViewModel>()
                              ..getSimiler(seriesId: seriesId, page: 1),
                            child:
                                SeeAllSeriesSimiler(seriesId: seriesId.toInt()),
                          ),
                        ));
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.25,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => SeriesCard(
                          isSimilar: true,
                          posterPath: SimilerSeriesViewModel
                                  .similerSeries[index].posterPath ??
                              "",
                          id: SimilerSeriesViewModel.similerSeries[index].id
                                  ?.toInt() ??
                              0,
                          name: SimilerSeriesViewModel
                                  .similerSeries[index].name ??
                              "",
                          firstAirDate: SimilerSeriesViewModel
                                  .similerSeries[index].firstAirDate ??
                              "",
                          backdropPath: SimilerSeriesViewModel
                                  .similerSeries[index].backdropPath ??
                              ""),
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 20,
                          ),
                      itemCount: SimilerSeriesViewModel.similerSeries.length),
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
