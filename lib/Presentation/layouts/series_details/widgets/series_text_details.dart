import 'package:animated_read_more_text/animated_read_more_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/data/models/categories/Genres.dart';
import 'package:movies_app/domain/entities/series/SeriesDetailsEntity.dart';

class SeriesTextDetails extends StatelessWidget {
  const SeriesTextDetails({super.key, required this.seriesDetailsEntity});
  final SeriesDetailsEntity seriesDetailsEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 12,
        ),
        Text(
          seriesDetailsEntity.name ?? "",
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 10,
        ),
        genersDisplay1() == ''
            ? const SizedBox()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(genersDisplay1(),
                      style: Theme.of(context).textTheme.titleSmall),
                  Text(
                    genersDisplay2(),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
        const SizedBox(
          height: 10,
        ),
        seriesDetailsEntity.voteAverage?.toStringAsFixed(1) == ""
            ? const SizedBox()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/Icons/star.svg"),
                  Text(
                      " ${seriesDetailsEntity.voteAverage?.toStringAsFixed(1)} / 10 from IMDb",
                      style: Theme.of(context).textTheme.labelMedium),
                  const SizedBox(
                    width: 20,
                  ),
                  SvgPicture.asset("assets/Icons/like.svg"),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                      "${((seriesDetailsEntity.voteAverage?.toDouble() ?? 0 / 10) * 10).toStringAsFixed(1)}% from users",
                      style: Theme.of(context).textTheme.labelMedium)
                ],
              ),
        const SizedBox(
          height: 24,
        ),
        seriesDetailsEntity.overview == ''
            ? const SizedBox()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Story Line",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 10),
                  AnimatedReadMoreText(
                    seriesDetailsEntity.overview ?? "",
                    maxLines: 3,
                    readMoreText: 'More',
                    readLessText: 'Less',
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    buttonTextStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  )
                ],
              )
      ],
    );
  }

  String genersDisplay1() {
    List<Genres>? geners = seriesDetailsEntity.genres ??= [];
    if (geners.isEmpty || geners[0].name == null) {
      return '';
    }
    return "• ${geners[0].name ?? ""} ";
  }

  String genersDisplay2() {
    List<Genres>? geners = seriesDetailsEntity.genres ??= [];
    if (geners.isEmpty || geners.length < 2 || geners[1].name == null) {
      return '';
    }
    return "• ${geners[1].name ?? ""} ";
  }
}
