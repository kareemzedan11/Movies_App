import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/Utils/routes.dart';
import 'package:movies_app/core/constants.dart';
import 'package:movies_app/data/models/firsbase_model/firebase_movie_model.dart';
import 'package:movies_app/domain/entities/series/TopRatedSeriesEntity.dart';

class TopRatedSeriesItemWidget extends StatelessWidget {
  const TopRatedSeriesItemWidget(
      {super.key, required this.topRatedSeriesEntity});
  final TopRatedSeriesEntity topRatedSeriesEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.seriesDetailsScreen,
            arguments: FireBaseMovieModel(
                backdropPath: topRatedSeriesEntity.backdropPath,
                id: topRatedSeriesEntity.id,
                mediaType: "tv",
                releaseDate: topRatedSeriesEntity.firstAirDate,
                title: topRatedSeriesEntity.name));
      },
      child: Stack(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 0.9,
            height: MediaQuery.sizeOf(context).height * 0.57,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: CachedNetworkImage(
                imageUrl:
                    "${Constants.imageBasePath}${topRatedSeriesEntity.posterPath}",
                placeholder: (context, url) => Container(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                errorWidget: (context, url, error) => Container(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                fit: BoxFit.fitHeight),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * 0.9,
            height: MediaQuery.sizeOf(context).height * 0.57,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black45,
                    Colors.black12,
                    Colors.black12.withOpacity(0.05)
                  ]),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ],
      ),
    );
  }
}
