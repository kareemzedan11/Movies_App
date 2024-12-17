import 'dart:developer';

import 'package:animated_read_more_text/animated_read_more_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/casts/media_cast/media_cast_widget_builder.dart';
import 'package:movies_app/Presentation/layouts/movie_details/provider/trailler_provider.dart';
import 'package:movies_app/Presentation/layouts/movie_details/view_model/movie_details_view_model.dart';
import 'package:movies_app/Presentation/layouts/movie_details/widgets/comments/widgets/comment_builder_widget.dart';
import 'package:movies_app/Presentation/layouts/movie_details/widgets/movie_trailler/trailler_widget_builder.dart';
import 'package:movies_app/Presentation/layouts/movie_details/widgets/movie_trailler/view_model/trailler_view_model.dart';
import 'package:movies_app/Presentation/layouts/movie_details/widgets/poster/poster_details_item.dart';
import 'package:movies_app/Presentation/layouts/movie_details/widgets/similer/similer_builder.dart';
import 'package:movies_app/core/DI/di.dart';
import 'package:movies_app/core/reusable%20components/book_mark_widget.dart';
import 'package:movies_app/core/reusable%20components/movie_card.dart';
import 'package:movies_app/domain/entities/movies/MovieDetailsEntitie.dart';
import 'package:provider/provider.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TraillerProvider>(context);
    SelectedMovie movie =
        ModalRoute.of(context)?.settings.arguments as SelectedMovie;
    log(movie.id.toString());
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<MovieDetailsHomeTabViewModel>()
            ..getMovieDetails(movieId: movie.id),
        ),
        BlocProvider(
          create: (context) => getIt<TraillerViewMode>()
            ..getMovieTrailler(movieId: movie.id, mediaType: "movie"),
        ),
      ],
      child: PopScope(
        onPopInvoked:(didPop) => SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: provider.isFullScreen
              ? null
              : AppBar(
                  backgroundColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                  leading: IconButton(
                    enableFeedback: false,
                    onPressed: () {
                      SystemChrome.setPreferredOrientations(
                          [DeviceOrientation.portraitUp]);
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
                      child: BookMarkWidget(movie: movie),
                    )
                  ],
                ),
          body: BlocBuilder<MovieDetailsHomeTabViewModel,
              MovieDetailsHomeTabStates>(
            builder: (context, state) {
              if (state is MovieDetailsHomeTabSuccessState) {
                MovieDetailsEntitie movie = state.details;
                return provider.isFullScreen
                    ? const TraillerWidgetBuilder()
                    : CustomScrollView(
                        physics: const ClampingScrollPhysics(),
                        slivers: [
                          SliverToBoxAdapter(
                              child: PosterDetailsItem(
                            movieDetailsEntitie: movie,
                          )),
                          const SliverToBoxAdapter(
                            child: SizedBox(height: 10),
                          ),
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  movie.overview == ''
                                      ? const SizedBox()
                                      : Text(
                                          "Overview",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineLarge,
                                        ),
                                  movie.overview == ''
                                      ? const SizedBox()
                                      : const SizedBox(height: 10),
                                  movie.overview == ''
                                      ? const SizedBox()
                                      : AnimatedReadMoreText(
                                          movie.overview ?? "",
                                          maxLines: 3,
                                          readMoreText: 'More',
                                          readLessText: 'Less',
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                          buttonTextStyle: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                        ),
                                  const SizedBox(height: 40),
                                ],
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: MediaCastWidgetBuilder(
                              mediaId: movie.id?.toInt() ?? 0,
                              title: "Movie Cast",
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                children: [
                                  const SizedBox(height: 40),
                                  const TraillerWidgetBuilder(),
                                  const SizedBox(height: 20),
                                  CommentBuilderWidget(
                                      movieId: movie.id?.toInt() ?? 0),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Column(
                              children: [
                                SimilerBuilder(movie: movie),
                              ],
                            ),
                          )
                        ],
                      );
              }
              if (state is MovieDetailsHomeTabErrorState) {
                return const Column(
                  children: [Text("error")],
                );
              }
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
