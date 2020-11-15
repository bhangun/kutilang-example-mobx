import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kutilangExample/services/apps_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../utils/config.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(child: SvgPicture.asset(IMAGE_SPLASH)),
    );
  }

  startTimer() {
    var _duration = Duration(milliseconds: 300);
    return Timer(_duration, navigate);
  }

  navigate() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (preferences.getBool(IS_LOGGED_IN) ?? false) {
      Navigator.of(context).pushReplacementNamed(AppsRoutes.login);
    } else {
      Navigator.of(context).pushReplacementNamed(AppsRoutes.login);
    }
  }
}
