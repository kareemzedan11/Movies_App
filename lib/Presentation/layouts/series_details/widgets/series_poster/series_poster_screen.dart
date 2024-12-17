import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/constants.dart';
import 'package:movies_app/domain/entities/series/SeriesDetailsEntity.dart';

class SeriesPosterScreen extends StatelessWidget {
  const SeriesPosterScreen({super.key, required this.seriesDetailsEntity});
  final SeriesDetailsEntity seriesDetailsEntity;
  @override
  Widget build(BuildContext context) {
    log(seriesDetailsEntity.id.toString());
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: width,
          height: height * 0.45,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: CachedNetworkImage(
              imageUrl:
                  "${Constants.imageBasePath}${seriesDetailsEntity.backdropPath}",
              placeholder: (context, url) => Container(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
              errorWidget: (context, url, error) => Container(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
              fit: BoxFit.fitHeight),
        ),
        Container(
          width: width,
          height: height * 0.45,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Theme.of(context).colorScheme.surface,
                Theme.of(context).colorScheme.surface.withOpacity(0.7),
                Theme.of(context).colorScheme.surface.withOpacity(0.2),
              ],
            ),
          ),
        ),
        Container(
          width: width * 0.45,
          height: height * 0.28,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: CachedNetworkImage(
              imageUrl:
                  "${Constants.imageBasePath}${seriesDetailsEntity.posterPath}",
              placeholder: (context, url) => Container(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
              errorWidget: (context, url, error) => Container(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
              fit: BoxFit.fill),
        ),
      ],
    );
  }
}
