
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_app/core/Utils/assets.dart';
import 'package:movies_app/core/Utils/color_Manager.dart';
import 'package:movies_app/core/Utils/routes.dart';
 

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

 

class _splashState extends State<splash> {
  @override

  void initState() {
    super.initState();
    Timer(const Duration(seconds:2 ) , (){ Navigator.pushReplacementNamed(context, Routes.loginRouteName);});
  }
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.backColor,
      child: Image.asset(AssetsManager.logo));
  }
}
