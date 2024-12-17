import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/casts/cast_jobs_screen.dart';
import 'package:movies_app/Presentation/layouts/movie_details/widgets/movie_trailler/thriller_widget.dart';
import 'package:movies_app/core/constants.dart';
import 'package:movies_app/domain/entities/movies/MovieCastEntity.dart';

class MediaCastItem extends StatelessWidget {
  const MediaCastItem({super.key, required this.movieCastEntity});
  final CastEntity movieCastEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            log(movieCastEntity.id.toString());
            youTubecontroller.pause();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    CastJobsScreen(movieCastEntity: movieCastEntity),
              ),
            );
          },
          child: Container(
            clipBehavior: Clip.hardEdge,
            height: MediaQuery.sizeOf(context).height * 0.1,
            width: MediaQuery.sizeOf(context).width * 0.25,
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
            child: CachedNetworkImage(
                imageUrl:
                    "${Constants.imageBasePath}${movieCastEntity.profilePath}",
                placeholder: (context, url) => Container(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                errorWidget: (context, url, error) => Icon(
                      Icons.person,
                      size: MediaQuery.sizeOf(context).width * 0.2,
                    ),
                fit: BoxFit.cover),
          ),
        ),
        Text(
          movieCastEntity.name ?? "",
          textAlign: TextAlign.end,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.grey[100]),
        )
      ],
    );
  }
}
