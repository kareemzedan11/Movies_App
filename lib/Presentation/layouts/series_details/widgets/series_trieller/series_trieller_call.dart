import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/layouts/movie_details/provider/trailler_provider.dart';
import 'package:movies_app/Presentation/layouts/movie_details/widgets/movie_trailler/thriller_widget.dart';
import 'package:movies_app/Presentation/layouts/movie_details/widgets/movie_trailler/view_model/trailler_view_model.dart';
import 'package:provider/provider.dart';

class SeriesTriellerCall extends StatelessWidget {
  const SeriesTriellerCall({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TraillerProvider>(context);
    return BlocBuilder<TraillerViewMode, TraillerViewModelState>(
      builder: (context, state) {
        if (state is TraillerSuccessState) {
          return state.traillerEntity!.isEmpty
              ? const SizedBox()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   provider.isFullScreen
                        ? const SizedBox()
                        : Text(
                      "Trailer",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    provider.isFullScreen
                        ? const SizedBox()
                        :const SizedBox(height: 10),
                    ThrillerWidget(
                      videoKey: state.traillerEntity?[0].key ?? "",
                    ),
                  ],
                );
        }
        return const SizedBox();
      },
    );
  }
}
