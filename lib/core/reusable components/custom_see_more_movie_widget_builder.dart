import 'package:easy_infinite_pagination/easy_infinite_pagination.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/reusable%20components/movie_card.dart';

class CustomSeeMoreMovieWidgetBuilder extends StatelessWidget {
  const CustomSeeMoreMovieWidgetBuilder({
    super.key,
    required this.scrollController,
    required this.itemCount,
    required this.movies,
  });

  final ScrollController scrollController;
  final int itemCount;
  final List movies;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InfiniteGridView(
        physics: const BouncingScrollPhysics(),
        controller: scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width >= 600 ? 3 : 2,
          childAspectRatio: 2,
          mainAxisSpacing: 20,
          mainAxisExtent: MediaQuery.of(context).size.height * 0.3,
          crossAxisSpacing: 20,
        ),
        delegate: PaginationDelegate(
          itemCount: itemCount,
          itemBuilder: (_, index) => MovieCard(
            imageBath: movies[index].posterPath ?? "",
            id: movies[index].id?.toInt() ?? 0,
            title: movies[index].title ?? "",
            releaseDate: movies[index].releaseDate ?? "",
            backdropPath: movies[index].backdropPath ?? "",
          ),
          // isLoading: _isLoading,
          onFetchData: () {},
        ),
      ),
    );

    //  Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: GridView.builder(
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: MediaQuery.of(context).size.width >= 600 ? 3 : 2,
    //       childAspectRatio: 2,
    //       mainAxisSpacing: 20,
    //       mainAxisExtent: MediaQuery.of(context).size.height * 0.3,
    //       crossAxisSpacing: 20,
    //     ),
    //     physics: const BouncingScrollPhysics(),
    //     controller: scrollController,
    //     itemCount: itemCount,
    //     itemBuilder: (context, index) {
    //       log("-------$index---------");
    //       return MovieCard(
    //         imageBath: movies[index].posterPath ?? "",
    //         id: movies[index].id?.toInt() ?? 0,
    //         title: movies[index].title ?? "",
    //         releaseDate: movies[index].releaseDate ?? "",
    //         backdropPath: movies[index].backdropPath ?? "",
    //       );
    //     },
    //   ),
    // );
  }
}
