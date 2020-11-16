import 'package:flutter/material.dart';
import 'package:kutilangExample/services/apps_routes.dart';

import '../services/apps_routes.dart';
import '../services/navigation.dart';

buildAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(title),
    actions: <Widget>[
      IconButton(
        onPressed: () {
          NavigationServices.navigateTo(AppsRoutes.home);
        },
        icon: Icon(
          Icons.power_settings_new,
        ),
      )
    ],
  );
}
