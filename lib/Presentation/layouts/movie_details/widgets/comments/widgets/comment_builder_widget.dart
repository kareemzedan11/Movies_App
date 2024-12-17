import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/layouts/movie_details/widgets/comments/view_model/comments_view_model_cubit.dart';
import 'package:movies_app/Presentation/layouts/movie_details/widgets/comments/widgets/comments_list_view.dart';
import 'package:movies_app/core/DI/di.dart';

class CommentBuilderWidget extends StatelessWidget {
  const CommentBuilderWidget({super.key, required this.movieId});
  final int movieId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<CommentsViewModelCubit>()..getMovieComments(movieId: movieId),
      child: BlocBuilder<CommentsViewModelCubit, CommentsViewModelState>(
        builder: (context, state) {
          if (state is CommentsViewModelSuccess) {
            log(state.commentsList.length.toString());
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Comments",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 15,
                ),
                CommentsListView(
                  comments: state.commentsList,
                ),
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
