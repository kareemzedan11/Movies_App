import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/provider/up_coming_provider.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/widgets/arabic_movies/arabic_movies_widget_builder.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/widgets/arabic_series/arabic_series_widget_builder.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/widgets/last_updated/last_updated_builder.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/widgets/popular/popular_widget_builder.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/widgets/popular_series/popular_series_builder.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/widgets/top_rated_series/top_rated_series_builder.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/widgets/up_coming/up_coming_builder.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 25,
          ),
        ),
        const SliverToBoxAdapter(child: TopRatedSeriesBuilder()),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 25,
          ),
        ),
        const SliverToBoxAdapter(child: PopularWidgetBuilder()),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 25,
          ),
        ),
        const SliverToBoxAdapter(
          child: ArabicMoviesWidgetBuilder(),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 25,
          ),
        ),
        const SliverToBoxAdapter(
          child: ArabicSeriesWidgetBuilder(),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 25,
          ),
        ),
        const SliverToBoxAdapter(
          child: PopularSeriesBuilder(),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 25,
          ),
        ),
        SliverToBoxAdapter(
          child: ChangeNotifierProvider(
              create: (context) => UpComingProvider(),
              child: const UpComingBuilder()),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 25,
          ),
        ),
        const SliverToBoxAdapter(
          child: LastUpdatedBuilder(),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 25,
          ),
        ),
      ],
    );
  }
}
