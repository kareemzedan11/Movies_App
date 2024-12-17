import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/layouts/movie_details/provider/trailler_provider.dart';
import 'package:movies_app/Presentation/layouts/movie_details/widgets/movie_trailler/thriller_widget.dart';
import 'package:movies_app/Presentation/layouts/movie_details/widgets/movie_trailler/view_model/trailler_view_model.dart';
import 'package:provider/provider.dart';

class TraillerWidgetBuilder extends StatelessWidget {
  const TraillerWidgetBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TraillerProvider>(context);
    return BlocBuilder<TraillerViewMode, TraillerViewModelState>(
      builder: (context, state) {
        if (state is TraillerSuccessState) {
          return state.traillerEntity!.isEmpty
              ? const SizedBox()
              : Column(
                  children: [
                    provider.isFullScreen
                        ? const SizedBox()
                        : Text(
                            "Trailer",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                    provider.isFullScreen
                        ? const SizedBox()
                        : const SizedBox(height: 15),
                    ThrillerWidget(
                      videoKey: state.traillerEntity?[0].key ?? "",
                    ),
                  ],
                );
        }
        if (state is TraillerErrorState) {
          return const SizedBox();
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
