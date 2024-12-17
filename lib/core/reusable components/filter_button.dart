
import 'package:flutter/material.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/watch%20list_tab/provider/watch_list_provider.dart';
import 'package:provider/provider.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
  });

  
  final List<String> choosenList = const [
    'All',
    'movie',
    'tv series',
  ];

  @override
  Widget build(BuildContext context) {
    
    var watchListProvider = Provider.of<WatchListProvider>(context);
    final String currentChoose = choosenList[watchListProvider.currentIndex];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Watchlist",
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(fontSize: 22),
          ),
          PopupMenuButton(
            position: PopupMenuPosition.under,
            enableFeedback: false,
            color: Theme.of(context).colorScheme.secondary,
            itemBuilder: (context) => [
              PopupMenuItem(
                  onTap: () {
                    watchListProvider.changeCurrentIndex(newIndex: 0);
                  },
                  child: Text(
                    choosenList[0],
                    style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  )),
              PopupMenuItem(
                  onTap: () {
                    watchListProvider.changeCurrentIndex(newIndex: 1);
                  },
                  child: Text(
                    choosenList[1],
                    style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  )),
              PopupMenuItem(
                onTap: () {
                  watchListProvider.changeCurrentIndex(newIndex: 2);
                },
                child: Text(
                  choosenList[2],
                  style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
            child: Row(
              children: [
                Text(
                  currentChoose,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 20,
                      fontWeight: FontWeight.w200),
                  textAlign: TextAlign.center,
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Theme.of(context).colorScheme.onSecondary,
                  size: 20,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
