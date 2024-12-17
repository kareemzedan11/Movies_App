import 'package:flutter/material.dart';

class ListTitleWidget extends StatelessWidget {
  const ListTitleWidget(
      {super.key,
      required this.title,
      this.onTap,
      this.isSeeAllVisable = true});
  final String title;
  final Function()? onTap;
  final bool isSeeAllVisable;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineLarge),
          Visibility(
            visible: isSeeAllVisable,
            maintainSize: true,
            maintainAnimation: true,
            maintainSemantics: true,
            maintainState: true,
            maintainInteractivity: true,
            child: GestureDetector(
              onTap: onTap,
              child: Text(
                "See All >",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          )
        ],
      ),
    );
  }
}
