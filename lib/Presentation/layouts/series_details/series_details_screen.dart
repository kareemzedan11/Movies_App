import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/casts/media_cast/media_cast_widget_builder.dart';
import 'package:movies_app/Presentation/layouts/movie_details/provider/trailler_provider.dart';
import 'package:movies_app/Presentation/layouts/movie_details/widgets/movie_trailler/view_model/trailler_view_model.dart';
import 'package:movies_app/Presentation/layouts/series_details/view_model.dart/series_details_view_model.dart';
import 'package:movies_app/Presentation/layouts/series_details/widgets/seasons/provider/season_provider.dart';
import 'package:movies_app/Presentation/layouts/series_details/widgets/seasons/seasons_screen.dart';
import 'package:movies_app/Presentation/layouts/series_details/widgets/series_poster/series_poster_screen.dart';
import 'package:movies_app/Presentation/layouts/series_details/widgets/series_text_details.dart';
import 'package:movies_app/Presentation/layouts/series_details/widgets/series_trieller/series_trieller_call.dart';
import 'package:movies_app/Presentation/layouts/series_details/widgets/similer_series/similer_series_widget_builder.dart';
import 'package:movies_app/core/DI/di.dart';
import 'package:movies_app/core/reusable%20components/book_mark_widget_series.dart';
import 'package:movies_app/data/models/firsbase_model/firebase_movie_model.dart';
import 'package:provider/provider.dart';

class SeriesDetailsScreen extends StatelessWidget {
  const SeriesDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TraillerProvider>(context);
    FireBaseMovieModel series =
        ModalRoute.of(context)?.settings.arguments as FireBaseMovieModel;
    log(series.isArabicSeries.toString());
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<SeriesDetailsViewModel>()
            ..getMovieDetails(seriesId: series.id?.toInt() ?? 0, page: 1),
        ),
        BlocProvider(
          create: (context) => getIt<TraillerViewMode>()
            ..getMovieTrailler(
                movieId: series.id?.toInt() ?? 0, mediaType: "tv"),
        ),
      ],
      child: PopScope(
onPopInvoked: (didPop) => SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar:provider.isFullScreen?null: AppBar(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            leading: IconButton(
              enableFeedback: false,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset(
                "assets/Icons/arrow_back.svg",
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: BookMarkWidgetSeries(
                  fireBaseMovieModel: series,
                ),
              )
            ],
          ),
          body: BlocBuilder<SeriesDetailsViewModel, SeriesDetailsViewModelState>(
            builder: (context, state) {
              if (state is SeriesDetailsViewModelSuccessState) {
                return provider.isFullScreen
                    ? const SeriesTriellerCall()
                    : CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: SeriesPosterScreen(
                        seriesDetailsEntity: state.details,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            SeriesTextDetails(seriesDetailsEntity: state.details),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: series.isArabicSeries!
                          ? const SizedBox()
                          : MediaCastWidgetBuilder(
                              mediaId: series.id?.toInt() ?? 0,
                              title: "Series Cast",
                            ),
                    ),
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            SeriesTriellerCall(),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: state.details.numberOfSeasons == 0
                          ? const SizedBox()
                          : ChangeNotifierProvider(
                              create: (context) => SeasonProvider(),
                              child: SeasonsScreen(
                                seriesId: state.details.id?.toInt() ?? 0,
                                seasonsCount:
                                    state.details.numberOfSeasons?.toInt() ?? 0,
                              )),
                    ),
                    SliverToBoxAdapter(
                      child: SimilerSeriesWidgetBuilder(
                        seriesId: series.id ?? 0,
                      ),
                    ),
                  ],
                );
              }
              if (state is SeriesDetailsViewModelErrorState) {
                return const Center(
                  child: Text("no data found :("),
                );
              }
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            },
          ),
        ),
      ),
    );
  }
}
