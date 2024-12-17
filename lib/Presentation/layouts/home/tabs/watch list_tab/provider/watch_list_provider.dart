import 'package:flutter/material.dart';

class WatchListProvider extends ChangeNotifier {
  int currentIndex = 0;
  changeCurrentIndex({required int newIndex}) {
    if (currentIndex == newIndex) return;
    currentIndex = newIndex;
    notifyListeners();
  }
}
