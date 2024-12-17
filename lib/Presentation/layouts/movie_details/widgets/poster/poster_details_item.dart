import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/constants.dart';
import 'package:movies_app/core/reusable%20components/movie_card.dart';
import 'package:movies_app/core/reusable%20components/movie_show_details.dart';
import 'package:movies_app/data/models/categories/Genres.dart';
import 'package:movies_app/domain/entities/movies/MovieDetailsEntitie.dart';

class PosterDetailsItem extends StatelessWidget {
  const PosterDetailsItem({super.key, required this.movieDetailsEntitie});
  final MovieDetailsEntitie movieDetailsEntitie;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
                  "${Constants.imageBasePath}${movieDetailsEntitie.backdropPath}",
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
                Theme.of(context).colorScheme.surface.withOpacity(0.5),
                Theme.of(context).colorScheme.surface.withOpacity(0.2),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: height * 0.23,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        movieDetailsEntitie.title ?? "",
                        maxLines: 3,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      MovieSmallDetails(
                          movieId: movieDetailsEntitie.id?.toInt() ?? 0,
                          style: Theme.of(context).textTheme.labelMedium),
                      genersDisplay1() == ''
                          ? const SizedBox()
                          : Row(
                              children: [
                                Text(genersDisplay1(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall),
                                Text(
                                  genersDisplay2(),
                                  style:
                                      Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            ),
                      const SizedBox(
                        height: 3,
                      ),
                      movieDetailsEntitie.voteAverage?.toStringAsFixed(1) == ""
                          ? const SizedBox()
                          : Row(
                              children: [
                                SvgPicture.asset("assets/Icons/star.svg"),
                                Text(
                                    " ${movieDetailsEntitie.voteAverage?.toStringAsFixed(1)} / 10 from IMDb",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium),
                              ],
                            ),
                      SizedBox(
                        width: width * 0.5,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            enableFeedback: false,
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            "Watch Now",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: height * 0.23,
                  child: MovieCard(
                    imageBath: movieDetailsEntitie.posterPath ?? "",
                    title: movieDetailsEntitie.title ?? "",
                    id: movieDetailsEntitie.id?.toInt() ?? 0,
                    backdropPath: movieDetailsEntitie.backdropPath ?? "",
                    releaseDate: movieDetailsEntitie.releaseDate ?? "",
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  String genersDisplay1({List<Genres>? geners}) {
    if (geners == null || geners.isEmpty || geners[0].name == null) {
      return '';
    }
    return "• ${geners[0].name} ";
  }

  String genersDisplay2({List<Genres>? geners}) {
    if (geners == null || geners.isEmpty || geners[0].name == null) {
      return '';
    }
    return "• ${geners[1].name} ";
  }
}
