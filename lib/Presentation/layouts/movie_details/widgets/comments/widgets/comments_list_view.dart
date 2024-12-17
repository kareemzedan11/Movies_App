import 'package:flutter/material.dart';
import 'package:movies_app/Presentation/layouts/movie_details/widgets/comments/widgets/comment_item.dart';
import 'package:movies_app/domain/entities/movies/MovieReviewEntity.dart';

class CommentsListView extends StatefulWidget {
  const CommentsListView({super.key, required this.comments});
  final List<MovieReviewEntity> comments;

  @override
  State<CommentsListView> createState() => _CommentsListViewState();
}

class _CommentsListViewState extends State<CommentsListView> {
  bool isSeeAllVisable = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CommentItem(
                      movieReviewEntity: widget.comments[index],
                      authorDetailsEntity:
                          widget.comments[index].authorDetails!,
                      isSeeAllVisable: isSeeAllVisable,
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              },
              separatorBuilder: (context, index) => const Divider(
                    color: Color(0xff413E50),
                    thickness: 1.5,
                  ),
              itemCount: isSeeAllVisable
                  ? (widget.comments.length >= 2 ? 2 : 1)
                  : widget.comments.length),
          const Divider(
            color: Color(0xff413E50),
            thickness: 1.5,
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              isSeeAllVisable = !isSeeAllVisable;
              setState(() {});
            },
            child: Text(
              isSeeAllVisable ? "See All >" : "See Less <",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
