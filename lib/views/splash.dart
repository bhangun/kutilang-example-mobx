import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kutilangExmaple/services/apps_routes.dart';
import 'package:kutilangExmaple/utils/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../utils/routes.dart';
import '../widgets/app_icon_widget.dart';

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
      child: Center(child: SvgPicture.asset(Preferences.splash_image)),
    );
  }

  startTimer() {
    var _duration = Duration(milliseconds: 300);
    return Timer(_duration, navigate);
  }

  navigate() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (preferences.getBool(Preferences.is_logged_in) ?? false) {
      Navigator.of(context).pushReplacementNamed(AppsRoutes.login);
    } else {
      Navigator.of(context).pushReplacementNamed(AppsRoutes.login);
    }
  }
}
