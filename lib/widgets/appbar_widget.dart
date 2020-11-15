

import 'package:flutter/material.dart';
import 'package:kutilangExample/services/apps_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/config.dart';


buildAppBar(BuildContext context, String title) {
    return AppBar(
      title: Text(title),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            SharedPreferences.getInstance().then((preference) {
              preference.setBool(IS_LOGGED_IN, false);
              Navigator.of(context).pushReplacementNamed(AppsRoutes.login);
            });
          },
          icon: Icon(
            Icons.power_settings_new,
          ),
        )
      ],
    );
  }


