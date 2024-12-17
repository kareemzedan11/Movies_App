import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/search_feature/widgets/search_screen.dart';

class SearchButtonWidget extends StatelessWidget {
  const SearchButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.only(right: width * 0.05),
      child: GestureDetector(
        onTap: () {
          showSearch(
            context: context,
            delegate: SearchScreen(),
          );
        },
        child: SvgPicture.asset(
          "assets/Icons/search.svg",
          colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onSecondary, BlendMode.srcIn),
        ),
      ),
    );
  }
}
