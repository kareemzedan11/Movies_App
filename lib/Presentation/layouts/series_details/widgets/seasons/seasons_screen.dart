import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/layouts/series_details/widgets/seasons/provider/season_provider.dart';
import 'package:movies_app/Presentation/layouts/series_details/widgets/seasons/view_model.dart/season_details_view_model.dart';
import 'package:movies_app/Presentation/layouts/series_details/widgets/seasons/widgets/episode_widget_item.dart';
import 'package:movies_app/Presentation/layouts/series_details/widgets/seasons/widgets/select_season_button.dart';
import 'package:movies_app/core/DI/di.dart';
import 'package:movies_app/core/Utils/texts_styles.dart';
import 'package:movies_app/domain/entities/series/SeasonDetailsEntity.dart';
import 'package:provider/provider.dart';

class SeasonsScreen extends StatelessWidget {
  const SeasonsScreen({
    super.key,
    required this.seriesId,
    required this.seasonsCount,
  });
  final int seriesId;
  final int seasonsCount;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SeasonProvider>(context);
    final blocKey = ValueKey(provider.seasonNumber);
    return BlocProvider(
      key: blocKey,
      create: (context) => getIt<SeasonDetailsViewModel>()
        ..getSeasons(seriesId: seriesId, seasonNumber: provider.seasonNumber),
      child: BlocBuilder<SeasonDetailsViewModel, SeasonDetailsViewModelState>(
        builder: (context, state) {
          if (state is SeasonDetailsViewModelSuccessState) {
            List<SeasonDetailsEntity> season = state.seasonDetailsEntity;
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Episodes",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            barrierColor: Colors.black87,
                            builder: (context) {
                              return SelectSeasonButton(
                                  provider: provider,
                                  seasonsCount: seasonsCount);
                            },
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Season ${provider.seasonNumber}",
                              style: TextsStyles.appBarTitle
                                  .copyWith(fontSize: 16),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.arrow_drop_down,
                              size: 30,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) => EpisodeWidgetItem(
                            seasonDetailsEntity: season[index],
                            index: index + 1,
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                      itemCount: season.length)
                ],
              ),
            );
          }
          return SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: const Center(child: CircularProgressIndicator.adaptive()));
        },
      ),
    );
  }
}
