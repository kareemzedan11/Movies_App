import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/constants.dart';
import 'package:movies_app/domain/entities/series/SeasonDetailsEntity.dart';

class EpisodeWidgetItem extends StatelessWidget {
  const EpisodeWidgetItem(
      {super.key, required this.seasonDetailsEntity, required this.index});
  final SeasonDetailsEntity seasonDetailsEntity;
  final int index;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.onSurface,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: height * 0.12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      clipBehavior: Clip.hardEdge,
                      child: CachedNetworkImage(
                          imageUrl:
                              "${Constants.imageBasePath}${seasonDetailsEntity.stillPath ?? ""}",
                          placeholder: (context, url) => Container(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                          errorWidget: (context, url, error) => Container(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                          fit: BoxFit.cover),
                    ),
                    Container(
                      height: height * 0.12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black45,
                      ),
                    ),
                    const Icon(
                      Icons.play_circle_outline_rounded,
                      color: Colors.white,
                      size: 40,
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Episode $index',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                    Text(seasonDetailsEntity.name ?? "",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              )
            ],
          ),
          seasonDetailsEntity.overview == ''
              ? const SizedBox()
              : const SizedBox(
                  height: 15,
                ),
          seasonDetailsEntity.overview == ''
              ? const SizedBox()
              : Text(
                  "over view",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontWeight: FontWeight.w500, fontSize: 20),
                ),
          Text(seasonDetailsEntity.overview ?? "",
              style: Theme.of(context).textTheme.labelMedium)
        ],
      ),
    );
  }
}
