import 'dart:developer';

import 'package:flutter/material.dart';

class SeasonProvider extends ChangeNotifier {
  int seasonNumber = 1;
  changeSeasonNumber({required int newValue}) {
    if (newValue == seasonNumber) return;
    log(newValue.toString());
    seasonNumber = newValue;
    notifyListeners();
  }
}
