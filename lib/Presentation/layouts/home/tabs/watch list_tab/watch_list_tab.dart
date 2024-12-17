import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/search_feature/view_model/search_view_model.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/watch%20list_tab/provider/watch_list_provider.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/watch%20list_tab/view_model/watch_list_view_model.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/watch%20list_tab/widgets/watch_list_builder_widget.dart';
import 'package:movies_app/Presentation/layouts/provider/auth_provider.dart';
import 'package:movies_app/core/DI/di.dart';
import 'package:movies_app/core/reusable%20components/filter_button.dart';
import 'package:movies_app/data/models/firsbase_model/firebase_movie_model.dart';
import 'package:provider/provider.dart';

class WatchListTab extends StatelessWidget {
  const WatchListTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthProvider>(context);
    var watchListProvider = Provider.of<WatchListProvider>(context);

    final blocKey = ValueKey(watchListProvider.currentIndex);
    return BlocProvider(
      key: blocKey,
      create: (context) {
        log(watchListProvider.currentIndex.toString());
        if (watchListProvider.currentIndex == 0) {
          return getIt<WatchListTabViewModel>()
            ..getFireStoreMovieAndSeries(
                userId: provider.fireBaseUserAuth!.uid);
        } else if (watchListProvider.currentIndex == 1) {
          return getIt<WatchListTabViewModel>()
            ..getFireStoreMovieOrSeries(
                userId: provider.fireBaseUserAuth!.uid, type: "movie");
        }
        return getIt<WatchListTabViewModel>()
          ..getFireStoreMovieOrSeries(
              userId: provider.fireBaseUserAuth!.uid, type: "tv");
      },
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 60),
            const FilterButton(),
            BlocBuilder<WatchListTabViewModel, WatchListTabStates>(
              builder: (context, state) {
                if (state is WatchListTabSuccessState) {
                  Stream<List<FireBaseMovieModel>> result =
                      state.fireBaseMovies;
                  return StreamBuilder(
                    stream: result,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/movieNotFound.png"),
                            Text(
                              "No movie found",
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        );
                      }
                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Expanded(
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/movieNotFound.png",
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "you Don't have a watch list  ):",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      var movie = snapshot.data!;
                      return Expanded(
                        child: CustomScrollView(
                          slivers: [
                            SliverList(
                              delegate: SliverChildListDelegate(
                                [
                                  SizedBox(height: 20),
                                  ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) =>
                                        WatchListBuilderWidget(
                                      fireBaseMovieModel: movie[index],
                                    ),
                                    separatorBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Divider(
                                          thickness: 1,
                                          endIndent: 15,
                                          indent: 15,
                                        ),
                                      );
                                    },
                                    itemCount: movie.length,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }

                if (state is SearchTabErrorState) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/movieNotFound.png"),
                      Text(
                        "No movie found",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  );
                }

                return const Align(
                  alignment: Alignment.center,
                  child: Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
