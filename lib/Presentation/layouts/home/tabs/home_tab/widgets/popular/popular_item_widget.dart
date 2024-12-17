import 'package:flutter/material.dart';
import 'package:movies_app/core/reusable%20components/movie_card.dart';

import '../../../../../../../domain/entities/movies/PopularEntitie.dart';

class PopularItemWidget extends StatelessWidget {
  const PopularItemWidget({super.key, required this.popularList});
  final List<PopularEntitie> popularList;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.25,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            PopularEntitie movie = popularList[index];
            return MovieCard(
              imageBath: movie.posterPath ?? "",
              id: movie.id?.toInt() ?? 0,
              title: movie.title ?? "",
              releaseDate: movie.releaseDate ?? "",
              backdropPath: movie.backdropPath ?? "",
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
          itemCount: popularList.length),
    );
  }
}
