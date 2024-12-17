import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/Presentation/layouts/category_filter/view_model/category_filter_view_model.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/watch%20list_tab/provider/watch_list_provider.dart';
import 'package:movies_app/core/reusable%20components/movie_card.dart';
import 'package:movies_app/core/reusable%20components/series_card.dart';
import 'package:movies_app/data/models/categories/Genres.dart';

class CategoryFilterScreen extends StatefulWidget {
  const CategoryFilterScreen({super.key, required this.category});
  final Genres category;

  @override
  State<CategoryFilterScreen> createState() => _CategoryFilterScreenState();
}

class _CategoryFilterScreenState extends State<CategoryFilterScreen> {
  late ScrollController _scrollController;
  int page = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(
        () {
          if (_scrollController.position.atEdge &&
              _scrollController.position.pixels != 0 &&
              !isLoading) {
            setState(() {
              isLoading = true;
            });
            ++page;
            context.read<CategoryFilterViewModel>().loadMore(
                  categoryId: widget.category.id!.toInt(),
                  mediaType: context.read<WatchListProvider>().currentIndex == 0
                      ? 'movie'
                      : 'tv',
                );
          }
        },
      );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("${widget.category.name}"),
        leading: IconButton(
          enableFeedback: false,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            "assets/Icons/arrow_back.svg",
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
        
      ),
      body: BlocBuilder<CategoryFilterViewModel, CategoryFilterStates>(
        builder: (context, state) {
          if (state is CategoryFilterSuccessState) {
            isLoading = false;
          }

          if (state is CategoryFilterErrorState) {
            isLoading = false;
            return Center(child: Text(state.error));
          }

          if (state is CategoryFilterInitialState ||
              state is CategoryFilterLoadingState &&
                  CategoryFilterViewModel.filterList.isEmpty) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          log(CategoryFilterViewModel.filterList.length.toString());
          return GridView.builder(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final item = CategoryFilterViewModel.filterList[index];
              if (item.title != null) {
                return MovieCard(
                  imageBath: item.posterPath ?? "",
                  id: item.id?.toInt() ?? 0,
                  title: item.title ?? "",
                  releaseDate: item.releaseDate ?? "",
                  backdropPath: item.backdropPath ?? "",
                );
              } else {
                return SeriesCard(
                  posterPath: item.posterPath ?? "",
                  id: item.id?.toInt() ?? 0,
                  name: item.name ?? "",
                  firstAirDate: item.firstAirDate ?? "",
                  backdropPath: item.backdropPath ?? "",
                );
              }
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.sizeOf(context).width >= 600 ? 3 : 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 15,
              mainAxisExtent: 250,
            ),
            itemCount: CategoryFilterViewModel.filterList.length,
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
          );
        },
      ),
    );
  }
}
