import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/layouts/category_filter/category_filter_screen.dart';
import 'package:movies_app/Presentation/layouts/category_filter/view_model/category_filter_view_model.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/watch%20list_tab/provider/watch_list_provider.dart';
import 'package:movies_app/core/DI/di.dart';
import 'package:movies_app/data/models/categories/Genres.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CategoryWidget extends StatelessWidget {
  final Genres category;
  final String imageName;
  const CategoryWidget(
      {super.key, required this.category, required this.imageName});

  @override
  Widget build(BuildContext context) {
    var watchListProvider = Provider.of<WatchListProvider>(context);
    var height = MediaQuery.sizeOf(context).height;
    return InkWell(
      enableFeedback: false,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider<CategoryFilterViewModel>(
              create: (context) => getIt<CategoryFilterViewModel>()
                ..getFilter(
                    categoryId: category.id!.toInt(),
                    mediaType:
                        watchListProvider.currentIndex == 0 ? 'movie' : 'tv',
                    page: 1),
              child: ChangeNotifierProvider(
                create: (context) => WatchListProvider(),
                child: CategoryFilterScreen(
                  category: category,
                ),
              ),
            ),
          ),
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: height * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            clipBehavior: Clip.hardEdge,
            child: CachedNetworkImage(
              imageUrl: imageName,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Theme.of(context).colorScheme.secondary,
              ),
              errorWidget: (context, url, error) => Container(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black45, borderRadius: BorderRadius.circular(15)),
          ),
          Text(
            category.name ?? "",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontSize: 22, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
