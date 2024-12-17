import 'package:flutter/material.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/view_model/popular_series_view_model.dart';
import 'package:movies_app/core/reusable%20components/series_card.dart';
import 'package:movies_app/domain/entities/series/TopRatedSeriesEntity.dart';

class PopularSeriesItemWidget extends StatelessWidget {
  const PopularSeriesItemWidget(
      {super.key, required this.topRatedSeriesEntityList});
  final List<TopRatedSeriesEntity> topRatedSeriesEntityList;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return SizedBox(
      height: height * 0.25,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            TopRatedSeriesEntity topRatedSeriesEntity =
                topRatedSeriesEntityList[index];
            return SeriesCard(
                posterPath: topRatedSeriesEntity.posterPath ?? "",
                id: topRatedSeriesEntity.id?.toInt() ?? 0,
                name: topRatedSeriesEntity.name ?? "",
                firstAirDate: topRatedSeriesEntity.firstAirDate ?? "",
                backdropPath: topRatedSeriesEntity.backdropPath ?? "");
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
          itemCount: PopularSeriesViewModel.popularList.length),
    );
  }
}
