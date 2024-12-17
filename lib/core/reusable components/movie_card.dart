import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/Utils/routes.dart';
import 'package:movies_app/core/constants.dart';

class MovieCard extends StatelessWidget {
  const MovieCard(
      {super.key,
      required this.imageBath,
      this.isSimilar = false,
      required this.id,
      required this.title,
      required this.releaseDate,
      required this.backdropPath});
  final String imageBath;
  final int id;
  final String title;
  final bool isSimilar;
  final String releaseDate;
  final String backdropPath;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        if (isSimilar) {
          Navigator.pushReplacementNamed(
              context, Routes.movieDetailsScreenRouteName,
              arguments: SelectedMovie(
                id: id,
                title: title,
                backdropPath: backdropPath,
                releaseDate: releaseDate,
                mediaType: "movie",
              ));
        } else {
          Navigator.pushNamed(context, Routes.movieDetailsScreenRouteName,
              arguments: SelectedMovie(
                id: id,
                title: title,
                backdropPath: backdropPath,
                releaseDate: releaseDate,
                mediaType: "movie",
              ));
        }
      },
      child: Container(
        width: width * 0.4,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: CachedNetworkImage(
            imageUrl: "${Constants.imageBasePath}$imageBath",
            placeholder: (context, url) => Container(
                  color: Theme.of(context).colorScheme.secondary,
                ),
            errorWidget: (context, url, error) => Container(
                  color: Theme.of(context).colorScheme.secondary,
                ),
            fit: BoxFit.cover),
      ),
    );
  }
}

class SelectedMovie {
  final String title;
  final num id;
  final String backdropPath;
  final String releaseDate;
  final String mediaType;
  const SelectedMovie({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.releaseDate,
    required this.mediaType,
  });
}
