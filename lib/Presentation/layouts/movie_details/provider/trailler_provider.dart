import 'package:flutter/material.dart';

class TraillerProvider extends ChangeNotifier {
  bool isFullScreen = false;
  changeIsFullScreen(bool newValue) {
    if (isFullScreen == newValue) return;
    isFullScreen = newValue;
    notifyListeners();
  }
}
