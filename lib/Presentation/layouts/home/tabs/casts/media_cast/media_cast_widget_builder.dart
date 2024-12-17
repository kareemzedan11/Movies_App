import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/casts/media_cast/media_cast_item.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/casts/view_model/cast_view_model_cubit.dart';
import 'package:movies_app/core/DI/di.dart';
import 'package:movies_app/core/reusable%20components/List_title_widget.dart';

class MediaCastWidgetBuilder extends StatelessWidget {
  const MediaCastWidgetBuilder(
      {super.key, required this.mediaId, required this.title});
  final num mediaId;
  final String title;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<CastViewModelCubit>()..getMovieCast(mediaId: mediaId),
      child: BlocBuilder<CastViewModelCubit, CastViewModelState>(
        builder: (context, state) {
          if (state is CastViewModelSuccessState) {
            return SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.19,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListTitleWidget(
                    title: title,
                    isSeeAllVisable: false,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => MediaCastItem(
                        movieCastEntity: state.movieCastEntity[index],
                      ),
                      itemCount: state.movieCastEntity.length,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        width: 20,
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          return const SizedBox(
            height: 20,
          );
        },
      ),
    );
  }
}
