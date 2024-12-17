import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/Utils/routes.dart';
import 'package:movies_app/core/reusable%20components/movie_card.dart';
import 'package:movies_app/domain/entities/movies/UpcomingEntitie.dart';

import '../../../../../../../core/constants.dart';

class UpComingItemWidget extends StatelessWidget {
  const UpComingItemWidget({
    super.key,
    required this.upcomingEntitie,
  });
  final UpcomingEntitie upcomingEntitie;

  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.movieDetailsScreenRouteName,
            arguments: SelectedMovie(
              id: upcomingEntitie.id?.toInt() ?? 0,
              title: upcomingEntitie.title ?? "",
              backdropPath: upcomingEntitie.backdropPath ?? "",
              releaseDate: upcomingEntitie.releaseDate ?? "",
              mediaType: "movie",
            ));
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: CachedNetworkImageProvider(
                  "${Constants.imageBasePath}${upcomingEntitie.posterPath}"),
              fit: BoxFit.fill),
        ),
      ),
    );
  }
}
