import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:movies_app/Presentation/layouts/movie_details/view_model/movie_details_view_model.dart';
import 'package:movies_app/Presentation/layouts/movie_details/view_model/rate_view_model.dart';
import 'package:movies_app/core/DI/di.dart';
import 'package:movies_app/data/models/movies/rating/Results.dart';
import 'package:movies_app/domain/entities/movies/MovieDetailsEntitie.dart';

class MovieSmallDetails extends StatelessWidget {
  const MovieSmallDetails(
      {super.key, required this.movieId, required this.style});
  final num movieId;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<MovieDetailsHomeTabViewModel>()
            ..getMovieDetails(movieId: movieId),
        ),
        BlocProvider(
          create: (context) =>
              getIt<RateViewModel>()..getMovieRate(movieId: movieId),
        )
      ],
      child:
          BlocBuilder<MovieDetailsHomeTabViewModel, MovieDetailsHomeTabStates>(
        builder: (context, state) {
          if (state is MovieDetailsHomeTabSuccessState) {
            MovieDetailsEntitie movie = state.details;
            return Row(
              children: [
                Text(
                  "${toYearFormat(movie.releaseDate)} ",
                  style: style,
                  overflow: TextOverflow.ellipsis,
                ),
                const RateDisplay(),
                Text(durationToString(movie.timeOfMovie!.toInt()),
                    style: style, overflow: TextOverflow.ellipsis)
              ],
            );
          }
          return const Text("");
        },
      ),
    );
  }

  String durationToString(int? minutes) {
    var d = Duration(minutes: minutes ?? 0);
    List<String> parts = d.toString().split(':');
    if (parts[0].padLeft(1, '') == "0" && parts[1].padLeft(2, '') == "00") {
      return "";
    }
    return '${parts[0].padLeft(1, '')} hour ${parts[1].padLeft(2, '')} minute(s)';
  }

  String toYearFormat(String? date) {
    DateFormat dateFormat = DateFormat("yyyy");
    if (date == "" || date == null) {
      date = "0000";
    }
    DateTime fudgeThis = dateFormat.parse(date);
    return fudgeThis.year.toString();
  }
}

class RateDisplay extends StatelessWidget {
  const RateDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RateViewModel, RateStates>(
      builder: (context, state) {
        if (state is RateSuccessState) {
          return Text("${checkIsUS(rateList: state.rate)} ",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.primary),
              overflow: TextOverflow.ellipsis);
        }
        return const Text("");
      },
    );
  }

  String checkIsUS({required List<RateResults> rateList}) {
    for (var i = 0; i < rateList.length; i++) {
      if (rateList[i].iso31661 == 'US') {
        return rateList[i].releaseDates?[0].certification ?? "";
      }
    }
    return '';
  }
}
