import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart' hide CarouselController;
 
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/provider/up_coming_provider.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/view_model/upcoming_home_tab_view_model.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/widgets/up_coming/up_coming_item_widget.dart';
import 'package:movies_app/core/DI/di.dart';
import 'package:movies_app/core/reusable%20components/List_title_widget.dart';
import 'package:provider/provider.dart';

class UpComingBuilder extends StatelessWidget {
  const UpComingBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var upComingProvider = Provider.of<UpComingProvider>(context);
    return BlocProvider(
      create: (context) {
        if (UpcomingHomeTabViewModel.upComingList.isEmpty) {
          return getIt<UpcomingHomeTabViewModel>()..getUpcoming();
        }
        return getIt<UpcomingHomeTabViewModel>()..getUpcomingDirectly();
      },
      child: BlocBuilder<UpcomingHomeTabViewModel, UpcomingHomeTabStates>(
        builder: (context, state) {
          if (state is UpcomingHomeTabSuccessState) {
            UpcomingHomeTabViewModel.upComingList = state.upcoming;
            return Column(
              children: [
                const ListTitleWidget(
                  title: "Coming Soon",
                  isSeeAllVisable: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      child: CarouselSlider.builder(
                          carouselController:CarouselSliderControllerImpl(),

                          itemBuilder: (context, index, index2) {
                            return UpComingItemWidget(
                              upcomingEntitie:
                                  UpcomingHomeTabViewModel.upComingList[index],
                            );
                          },
                          itemCount: 6,
                          options: CarouselOptions(
                            autoPlayCurve: Curves.fastOutSlowIn,
                            height: MediaQuery.sizeOf(context).height * 0.5,
                            autoPlay: true,
                            enlargeCenterPage: false,
                            viewportFraction: 1,
                            autoPlayInterval: const Duration(seconds: 3),
                            onPageChanged: (index, reason) {
                              upComingProvider.changeCurrentIndex(index);
                            },
                          )),
                    ),
                    DotsIndicator(
                      dotsCount: 6,
                      position: upComingProvider.currentIndex,
                      decorator: DotsDecorator(
                        activeColor: Theme.of(context).colorScheme.primary,
                        activeShape: const CircleBorder(),
                        activeSize: const Size(10.0, 10.0),
                        color: Colors.white,
                        shape: const CircleBorder(),
                        size: const Size(10.0, 10),
                      ),
                    )
                  ],
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

 