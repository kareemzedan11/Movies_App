import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/search_feature/view_model/search_view_model.dart';
import 'package:movies_app/core/reusable%20components/movie_card.dart';
import 'package:movies_app/core/reusable%20components/series_card.dart';
import 'package:movies_app/domain/entities/SearchEntity.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchTabViewModel, SearchTabStates>(
      builder: (context, state) {
        if (state is SearchTabSuccessState) {
          log("success");
          List<SearchEntity> result = state.searchResult;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: result.length,
              itemBuilder: (context, index) {
                return result[index].name == null
                    ? MovieCard(
                        imageBath: result[index].posterPath ?? "",
                        id: result[index].id?.toInt() ?? 0,
                        title: result[index].title ?? "",
                        releaseDate: result[index].releaseDate ?? "",
                        backdropPath: result[index].backdropPath ?? "")
                    : SeriesCard(
                        posterPath: result[index].posterPath ?? "",
                        id: result[index].id?.toInt() ?? 0,
                        name: result[index].name ?? "",
                        firstAirDate: result[index].firstAirDate ?? "",
                        backdropPath: result[index].backdropPath ?? "");
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2,
                mainAxisExtent: MediaQuery.sizeOf(context).height * 0.30,
                mainAxisSpacing: 20,
                crossAxisSpacing: 25,
              ),
            ),
          );
        }
        if (state is SearchTabErrorState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/movieNotFound.png"),
              Text(
                "No movie found",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
