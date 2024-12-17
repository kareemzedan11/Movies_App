import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/Utils/routes.dart';
import 'package:movies_app/core/constants.dart';
import 'package:movies_app/data/models/firsbase_model/firebase_movie_model.dart';

class SeriesCard extends StatelessWidget {
  const SeriesCard(
      {super.key,
      required this.posterPath,
      this.isSimilar = false,
      required this.id,
      required this.name,
      required this.firstAirDate,
      required this.backdropPath,
      this.isArabicSeries = false});
  final String posterPath;
  final int id;
  final String name;
  final bool isSimilar;
  final String firstAirDate;
  final String backdropPath;
  final bool isArabicSeries;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        if (isSimilar) {
          Navigator.pushReplacementNamed(
            context,
            Routes.seriesDetailsScreen,
            arguments: FireBaseMovieModel(
                backdropPath: backdropPath,
                id: id,
                releaseDate: firstAirDate,
                title: name,
                mediaType: "tv",
                isArabicSeries: isArabicSeries),
          );
        } else {
          Navigator.pushNamed(
            context,
            Routes.seriesDetailsScreen,
            arguments: FireBaseMovieModel(
                backdropPath: backdropPath,
                id: id,
                releaseDate: firstAirDate,
                title: name,
                mediaType: "tv",
                isArabicSeries: isArabicSeries),
          );
        }
      },
      child: Container(
        width: width * 0.4,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: CachedNetworkImage(
            imageUrl: "${Constants.imageBasePath}$posterPath",
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
