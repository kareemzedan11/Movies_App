import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/browse_tab/view_model/browse_view_model.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/browse_tab/widgets/category_widget.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/watch%20list_tab/provider/watch_list_provider.dart';
import 'package:movies_app/core/DI/di.dart';
import 'package:provider/provider.dart';

import '../../../../../data/models/categories/Genres.dart';

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  final List<String> choosenList = const [
    'movie',
    'tv series',
  ];

  @override
  Widget build(BuildContext context) {
    var watchListProvider = Provider.of<WatchListProvider>(context);
    final String currentChoose = choosenList[watchListProvider.currentIndex];
    final blocKey = ValueKey(watchListProvider.currentIndex);
    return BlocProvider(
      key: blocKey,
      create: (BuildContext context) {
        if (BrowseTabViewModel.categories.isEmpty) {
          return getIt<BrowseTabViewModel>()
            ..getCategory(mediaType: currentChoose == 'movie' ? "movie" : "tv");
        }
        return getIt<BrowseTabViewModel>()..getCategoryDirectly();
      },
      child: BlocBuilder<BrowseTabViewModel, BrowseTabStates>(
        builder: (context, state) {
          if (state is BrowseTabSuccessState) {
            BrowseTabViewModel.categories = state.categories;
            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: SizedBox(height: 60)),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      children: [
                        Text(
                          "Browse Category",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(fontSize: 22),
                        ),
                        const Spacer(),
                        PopupMenuButton(
                          position: PopupMenuPosition.under,
                          enableFeedback: false,
                          color: Theme.of(context).colorScheme.secondary,
                          onSelected: (int index) {
                            BrowseTabViewModel.categories = [];
                            watchListProvider.changeCurrentIndex(
                                newIndex: index);
                          },
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 0,
                              child: Text(
                                choosenList[0],
                                style: const TextStyle(
                                    color: Colors.white60,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            PopupMenuItem(
                              value: 1,
                              child: Text(
                                choosenList[1],
                                style: const TextStyle(
                                    color: Colors.white60,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                          child: Row(
                            children: [
                              Text(
                                currentChoose,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w200),
                                textAlign: TextAlign.center,
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(25),
                  sliver: SliverGrid.builder(
                    itemCount: BrowseTabViewModel.categories.length,
                    itemBuilder: (context, index) => CategoryWidget(
                        category: BrowseTabViewModel.categories[index],
                        imageName: currentChoose == 'movie'
                            ? Genres.categoriesMovieImagesList[index]
                            : Genres.categoriesSeriesImagesList[index]),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2,
                      mainAxisSpacing: 25,
                      mainAxisExtent: MediaQuery.of(context).size.height * 0.2,
                      crossAxisSpacing: 16,
                    ),
                  ),
                ),
              ],
            );
          }
          if (state is BrowseTabErrorState) {
            return Text(
              "No Categories found",
              style: Theme.of(context).textTheme.labelSmall,
            );
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
    );
  }
}
