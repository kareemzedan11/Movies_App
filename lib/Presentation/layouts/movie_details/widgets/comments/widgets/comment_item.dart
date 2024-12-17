import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/constants.dart';
import 'package:movies_app/domain/entities/movies/MovieReviewEntity.dart';

class CommentItem extends StatelessWidget {
  const CommentItem(
      {super.key,
      required this.movieReviewEntity,
      required this.authorDetailsEntity,
      required this.isSeeAllVisable});
  final MovieReviewEntity movieReviewEntity;
  final AuthorDetailsEntity authorDetailsEntity;
  final bool isSeeAllVisable;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: CachedNetworkImage(
                  imageUrl:
                      "${Constants.imageBasePath}${authorDetailsEntity.avatarPath}",
                  placeholder: (context, url) => Container(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                  errorWidget: (context, url, error) => Container(
                        color: const Color(0xffC4C4C4),
                        child: Icon(
                          Icons.person,
                          color: const Color(0xff7F7D88),
                          size: MediaQuery.sizeOf(context).width * 0.1,
                        ),
                      ),
                  fit: BoxFit.fill),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              authorDetailsEntity.username ?? "",
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
        Text(
          movieReviewEntity.content ?? "",
          maxLines: isSeeAllVisable ? 3 : null,
        ),
      ],
    );
  }
}
