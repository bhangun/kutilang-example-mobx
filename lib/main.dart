// 
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'bloc/app/app_bloc.dart';
import 'generated/i18n.dart';
import 'services/navigation.dart';
import 'utils/config.dart';
import 'utils/modules_registry.dart';
import 'views/splash.dart';
import 'utils/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
 
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) {
    ModulesRegistry();
    runApp(KutilangApp());
  });
}

class KutilangApp extends StatelessWidget {
  final _appBloc = AppStore();
  final _appKey = GlobalKey<State>();
 
  @override
  Widget build(BuildContext context) {
    return Observer(
      key: Key('app'),
      builder: (context) {
        return MaterialApp(
            key: _appKey,
            title: APP_NAME,
            theme: _appBloc.theme,
            routes: AppRoutes.routes,
            home: SplashScreen(),
            navigatorKey: NavigationServices.navigatorKey,
            debugShowCheckedModeBanner: false,
            locale: Locale(_appBloc.locale, "en"),
            localizationsDelegates: [S.delegate],
            supportedLocales: S.delegate.supportedLocales,
            localeResolutionCallback:
            S.delegate.resolution(fallback: new Locale(LOCALE_ENGLISH, "en")),
        );
      }
    );
  }
}