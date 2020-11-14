// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_bloc.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on _AppStore, Store {
  final _$localeAtom = Atom(name: '_AppStore.locale');

  @override
  String get locale {
    _$localeAtom.reportRead();
    return super.locale;
  }

  @override
  set locale(String value) {
    _$localeAtom.reportWrite(value, super.locale, () {
      super.locale = value;
    });
  }

  final _$isLightThemeAtom = Atom(name: '_AppStore.isLightTheme');

  @override
  bool get isLightTheme {
    _$isLightThemeAtom.reportRead();
    return super.isLightTheme;
  }

  @override
  set isLightTheme(bool value) {
    _$isLightThemeAtom.reportWrite(value, super.isLightTheme, () {
      super.isLightTheme = value;
    });
  }

  final _$themeAtom = Atom(name: '_AppStore.theme');

  @override
  ThemeData get theme {
    _$themeAtom.reportRead();
    return super.theme;
  }

  @override
  set theme(ThemeData value) {
    _$themeAtom.reportWrite(value, super.theme, () {
      super.theme = value;
    });
  }

  final _$_AppStoreActionController = ActionController(name: '_AppStore');

  @override
  dynamic switchTheme(bool value) {
    final _$actionInfo =
        _$_AppStoreActionController.startAction(name: '_AppStore.switchTheme');
    try {
      return super.switchTheme(value);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic switchToDark() {
    final _$actionInfo =
        _$_AppStoreActionController.startAction(name: '_AppStore.switchToDark');
    try {
      return super.switchToDark();
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic switchToLight() {
    final _$actionInfo = _$_AppStoreActionController.startAction(
        name: '_AppStore.switchToLight');
    try {
      return super.switchToLight();
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic switchLocale(String _locale) {
    final _$actionInfo =
        _$_AppStoreActionController.startAction(name: '_AppStore.switchLocale');
    try {
      return super.switchLocale(_locale);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic goTo(String route) {
    final _$actionInfo =
        _$_AppStoreActionController.startAction(name: '_AppStore.goTo');
    try {
      return super.goTo(route);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
locale: ${locale},
isLightTheme: ${isLightTheme},
theme: ${theme}
    ''';
  }
}
