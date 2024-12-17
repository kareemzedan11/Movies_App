import 'package:flutter/material.dart';

class UpComingProvider extends ChangeNotifier {
  int currentIndex = 0;
  changeCurrentIndex(int value) {
    if (currentIndex == value) return;
    currentIndex = value;
    notifyListeners();
  }
}
