import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/layouts/movie_details/view_model/similer_view_model.dart';
import 'package:movies_app/Presentation/layouts/movie_details/widgets/movie_trailler/thriller_widget.dart';
import 'package:movies_app/Presentation/layouts/movie_details/widgets/similer/see_all_similer.dart';
import 'package:movies_app/core/DI/di.dart';
import 'package:movies_app/core/reusable%20components/List_title_widget.dart';
import 'package:movies_app/core/reusable%20components/movie_card.dart';

// ignore: must_be_immutable
class SimilerBuilder extends StatelessWidget {
  SimilerBuilder({super.key, required this.movie});
  dynamic movie;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => getIt<SimilerHomeTabViewModel>()
        ..getSimiler(movieId: movie.id, page: 1),
      child: BlocBuilder<SimilerHomeTabViewModel, SimilerHomeTabStates>(
        builder: (context, state) {
          if (state is SimilerHomeTabSuccessState) {
            SimilerHomeTabViewModel.similerList = state.similer;
            return SimilerHomeTabViewModel.similerList.isEmpty
                ? const SizedBox()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      ListTitleWidget(
                        title: "More Like This",
                        onTap: () {
                          youTubecontroller.pause();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) =>
                                    getIt<SimilerHomeTabViewModel>()
                                      ..getSimiler(movieId: movie.id, page: 1),
                                child: SeeAllSimiler(movieId: movie.id),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: height * 0.25,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              if (SimilerHomeTabViewModel.similerList.length >
                                  3) {
                                return MovieCard(
                                  imageBath: SimilerHomeTabViewModel
                                          .similerList[index].posterPath ??
                                      "",
                                  title: SimilerHomeTabViewModel
                                          .similerList[index].title ??
                                      "",
                                  id: SimilerHomeTabViewModel
                                          .similerList[index].id
                                          ?.toInt() ??
                                      0,
                                  isSimilar: true,
                                  releaseDate: SimilerHomeTabViewModel
                                          .similerList[index].releaseDate ??
                                      "",
                                  backdropPath: SimilerHomeTabViewModel
                                          .similerList[index].backdropPath ??
                                      "",
                                );
                              } else {
                                return const Text("error");
                              }
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 20,
                                ),
                            itemCount:
                                SimilerHomeTabViewModel.similerList.length),
                      ),
                      const SizedBox(height: 17)
                    ],
                  );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
