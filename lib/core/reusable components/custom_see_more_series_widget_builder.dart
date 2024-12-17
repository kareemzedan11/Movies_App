import 'package:easy_infinite_pagination/easy_infinite_pagination.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/reusable%20components/series_card.dart';

class CustomSeeMoreSeriesWidgetBuilder extends StatelessWidget {
  const CustomSeeMoreSeriesWidgetBuilder({
    super.key,
    required this.scrollController,
    required this.itemCount,
    required this.series,
    this.isArabicSeries=false,
  });

  final ScrollController scrollController;
  final int itemCount;
  final List series;
  final bool isArabicSeries;
  @override
  Widget build(BuildContext context) {
    return InfiniteGridView(
      physics: const BouncingScrollPhysics(),
      controller: scrollController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width >= 600 ? 3 : 2,
        childAspectRatio: 2,
        mainAxisSpacing: 20,
        mainAxisExtent: MediaQuery.of(context).size.height * 0.3,
        crossAxisSpacing: 20,
      ),
      delegate: PaginationDelegate(
        itemCount: itemCount,
        itemBuilder: (_, index) => SeriesCard(
          id: series[index].id?.toInt() ?? 0,
          name: series[index].name ?? "",
          firstAirDate: series[index].firstAirDate ?? "",
          backdropPath: series[index].backdropPath ?? "",
          posterPath: series[index].posterPath ?? "",
          isArabicSeries: isArabicSeries,
        ),
        // isLoading: _isLoading,
        onFetchData: () {},
      ),
    );
  }
}
