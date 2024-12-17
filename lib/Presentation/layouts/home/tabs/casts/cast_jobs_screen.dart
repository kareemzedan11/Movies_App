import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/casts/view_model/cast_jobs_view_model_cubit.dart';
import 'package:movies_app/core/DI/di.dart';
import 'package:movies_app/core/reusable%20components/custom_see_more_app_bar.dart';
import 'package:movies_app/core/reusable%20components/movie_card.dart';
import 'package:movies_app/core/reusable%20components/series_card.dart';
import 'package:movies_app/domain/entities/movies/MovieCastEntity.dart';

class CastJobsScreen extends StatelessWidget {
  const CastJobsScreen({super.key, required this.movieCastEntity});
  final CastEntity movieCastEntity;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CastJobsViewModelCubit>()
        ..getCastJobs(castId: movieCastEntity.id.toString()),
      child: Scaffold(
        appBar: customSeeMoreAppBar(context,
            appBarTitle: movieCastEntity.name ?? ""),
        body: BlocBuilder<CastJobsViewModelCubit, CastJobsViewModelState>(
          builder: (context, state) {
            if (state is CastJobsViewModelSuccessState) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        MediaQuery.of(context).size.width >= 600 ? 3 : 2,
                    childAspectRatio: 2,
                    mainAxisSpacing: 20,
                    mainAxisExtent: MediaQuery.of(context).size.height * 0.25,
                    crossAxisSpacing: 20,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.castJobsEntity.length,
                  itemBuilder: (context, index) {
                    if (state.castJobsEntity[index].mediaType == 'movie') {
                      return MovieCard(
                        imageBath: state.castJobsEntity[index].posterPath ?? "",
                        id: state.castJobsEntity[index].id?.toInt() ?? 0,
                        title: state.castJobsEntity[index].title ?? "",
                        releaseDate:
                            state.castJobsEntity[index].releaseDate ?? "",
                        backdropPath:
                            state.castJobsEntity[index].backdropPath ?? "",
                      );
                    } else {
                      return SeriesCard(
                          posterPath:
                              state.castJobsEntity[index].posterPath ?? "",
                          id: state.castJobsEntity[index].id?.toInt() ?? 0,
                          name: state.castJobsEntity[index].name ?? "",
                          firstAirDate:
                              state.castJobsEntity[index].firstAirPath ?? "",
                          backdropPath:
                              state.castJobsEntity[index].backdropPath ?? "");
                    }
                  },
                ),
              );
            }
            if (state is CastJobsViewModelErrorState) {
              return Text(
                "no data for this actor :(",
                style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              );
            }
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          },
        ),
      ),
    );
  }
}
