import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/view_model/last_updated_view_model.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/widgets/last_updated/see_all_last_updated.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/widgets/popular/popular_item_widget.dart';
import 'package:movies_app/core/DI/di.dart';
import 'package:movies_app/core/reusable%20components/List_title_widget.dart';

class LastUpdatedBuilder extends StatelessWidget {
  const LastUpdatedBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        if (LastUpdatedViewModel.lastUpdatedList.isEmpty) {
          return getIt<LastUpdatedViewModel>()..getlastUpdatedMovies(page: 1);
        }
        return getIt<LastUpdatedViewModel>()..getPopularDirectly();
      },
      child: BlocBuilder<LastUpdatedViewModel, LastUpdatedViewModelState>(
        builder: (context, state) {
          if (state is LastUpdatedViewModelSuccess) {
            LastUpdatedViewModel.lastUpdatedList = state.lastUpdatedMovies;
            return Column(
              children: [
                ListTitleWidget(
                  title: "Last Updated",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => getIt<LastUpdatedViewModel>()
                            ..getlastUpdatedMovies(page: 1),
                          child: const Scaffold(body: SeeAllLastUpdated()),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                PopularItemWidget(
                    popularList: LastUpdatedViewModel.lastUpdatedList),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
