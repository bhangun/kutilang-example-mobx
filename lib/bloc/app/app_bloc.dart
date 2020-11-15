import 'package:f_logs/f_logs.dart';
import 'package:flutter/material.dart';
import 'package:kutilangExample/services/navigation.dart';
import 'package:kutilangExample/themes/theme_services.dart';
import 'package:mobx/mobx.dart';

part 'app_bloc.g.dart';

class AppStore = _AppStore with _$AppStore;


abstract class _AppStore with Store {

  _AppStore(){
     //reaction((_) => isLightTheme,switchTheme);
  }

  @observable
  String locale = 'en';

  @observable
  bool isLightTheme = false;

  bool isLocale = true;

  @observable
  ThemeData theme;

  String errorMessage='error';

  bool showError = false;

  @action
  switchTheme(bool value){
    isLightTheme?switchToLight():switchToDark();
  }

  @action
  switchToDark(){
     FLog.info(text:'dark');
    
    theme = ThemeServices.darkTheme();
    isLightTheme = false;
  }

  @action
  switchToLight(){
    FLog.info(text:'light');
    
    theme = ThemeServices.lightTheme();
    isLightTheme = true;
  }

  @action
  switchLocale(String _locale){
    locale = _locale;
  }

  @action
  goTo(String route) {
    NavigationServices.navigateTo(route);
  }

}