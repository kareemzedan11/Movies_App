 import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar customSeeMoreAppBar(BuildContext context,
      {required String appBarTitle}) {
    return AppBar(
      title: Text(appBarTitle),
      leading: IconButton(
        enableFeedback: false,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset(
          "assets/Icons/arrow_back.svg",
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
    );
  }