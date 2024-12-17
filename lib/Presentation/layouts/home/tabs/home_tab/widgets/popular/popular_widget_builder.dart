
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/view_model/popular_home_tab_view_model.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/widgets/popular/popular_item_widget.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/widgets/popular/see_all_popular.dart';
import 'package:movies_app/core/DI/Di.dart';
import 'package:movies_app/core/reusable%20components/List_title_widget.dart';


class PopularWidgetBuilder extends StatefulWidget {
  const PopularWidgetBuilder({super.key});

  @override
  State<PopularWidgetBuilder> createState() => _PopularWidgetBuilderState();
}

class _PopularWidgetBuilderState extends State<PopularWidgetBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        if (PopularHomeTabViewModel.popularList.isEmpty) {
          return getIt<PopularHomeTabViewModel>()
            ..getPopular(page: 1);
        }
        return getIt<PopularHomeTabViewModel>()..getPopularDirectly();
      },
      child: BlocBuilder<PopularHomeTabViewModel, PopularHomeTabStates>(
          builder: (context, state) {
        if (state is PopularHomeTabSuccessState) {
          PopularHomeTabViewModel.popularList = state.categories;

          return Column(
            children: [
              ListTitleWidget(
                title: "Most Popular",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => BlocProvider(
                        create: (context) => getIt<PopularHomeTabViewModel>()
                          ..getPopular(page: 1),
                        child: const SeeAllpopular(),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              PopularItemWidget(
                popularList: PopularHomeTabViewModel.popularList,
              ),
            ],
          );
        }
        return const Center(child: CircularProgressIndicator.adaptive());
      }),
    );
  }
}
