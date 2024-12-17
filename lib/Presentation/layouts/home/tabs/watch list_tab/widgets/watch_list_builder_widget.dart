import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/Presentation/layouts/provider/auth_provider.dart';
import 'package:movies_app/core/Utils/routes.dart';
import 'package:movies_app/core/constants.dart';
import 'package:movies_app/core/firebase/firestore_helper.dart';
import 'package:movies_app/core/reusable%20components/movie_card.dart';
import 'package:movies_app/core/reusable%20components/movie_show_details.dart';
import 'package:movies_app/data/models/firsbase_model/firebase_movie_model.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class WatchListBuilderWidget extends StatelessWidget {
  const WatchListBuilderWidget({super.key, required this.fireBaseMovieModel});

  final FireBaseMovieModel fireBaseMovieModel;
  @override
  Widget build(BuildContext context) {
    log(fireBaseMovieModel.mediaType ?? "");
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return InkWell(
      enableFeedback: false,
      onTap: () {
        fireBaseMovieModel.mediaType == "tv"
            ? Navigator.pushNamed(context, Routes.seriesDetailsScreen,
                arguments: fireBaseMovieModel)
            : Navigator.pushNamed(
                context,
                Routes.movieDetailsScreenRouteName,
                arguments: SelectedMovie(
                    id: fireBaseMovieModel.id?.toInt() ?? 0,
                    title: fireBaseMovieModel.title ?? "",
                    backdropPath: fireBaseMovieModel.backdropPath ?? "",
                    releaseDate: fireBaseMovieModel.releaseDate ?? "",
                    mediaType: "movie"),
              );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            SizedBox(
              height: 100,
              width: 150,
              child: Material(
                borderRadius: BorderRadius.circular(5),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          "${Constants.imageBasePath}${fireBaseMovieModel.backdropPath}",
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        enableFeedback: false,
                        onTap: () {
                          FireStoreHelper.deleteMovie(
                              userId: authProvider.fireBaseUserAuth!.uid,
                              movieId: fireBaseMovieModel.id?.toInt() ?? 0);
                        },
                        child: SvgPicture.asset(
                          "assets/Icons/bookmark.svg",
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).colorScheme.primary,
                              BlendMode.srcIn),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fireBaseMovieModel.title ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontSize: 15),
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                  ),
                  MovieSmallDetails(
                    movieId: fireBaseMovieModel.id ?? 0,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(fontSize: 14),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
