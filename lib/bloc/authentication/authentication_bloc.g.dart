// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_bloc.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthenticationStore on _AuthenticationStore, Store {
  Computed<bool> _$canForgetPasswordComputed;

  @override
  bool get canForgetPassword => (_$canForgetPasswordComputed ??= Computed<bool>(
          () => super.canForgetPassword,
          name: '_AuthenticationStore.canForgetPassword'))
      .value;
  Computed<bool> _$hasErrorsInLoginComputed;

  @override
  bool get hasErrorsInLogin => (_$hasErrorsInLoginComputed ??= Computed<bool>(
          () => super.hasErrorsInLogin,
          name: '_AuthenticationStore.hasErrorsInLogin'))
      .value;
  Computed<bool> _$hasErrorsInRegisterComputed;

  @override
  bool get hasErrorsInRegister => (_$hasErrorsInRegisterComputed ??=
          Computed<bool>(() => super.hasErrorsInRegister,
              name: '_AuthenticationStore.hasErrorsInRegister'))
      .value;
  Computed<bool> _$hasErrorInForgotPasswordComputed;

  @override
  bool get hasErrorInForgotPassword => (_$hasErrorInForgotPasswordComputed ??=
          Computed<bool>(() => super.hasErrorInForgotPassword,
              name: '_AuthenticationStore.hasErrorInForgotPassword'))
      .value;

  final _$usernameAtom = Atom(name: '_AuthenticationStore.username');

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  final _$userMessageAtom = Atom(name: '_AuthenticationStore.userMessage');

  @override
  String get userMessage {
    _$userMessageAtom.reportRead();
    return super.userMessage;
  }

  @override
  set userMessage(String value) {
    _$userMessageAtom.reportWrite(value, super.userMessage, () {
      super.userMessage = value;
    });
  }

  final _$passwordAtom = Atom(name: '_AuthenticationStore.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$passwordMessageAtom =
      Atom(name: '_AuthenticationStore.passwordMessage');

  @override
  String get passwordMessage {
    _$passwordMessageAtom.reportRead();
    return super.passwordMessage;
  }

  @override
  set passwordMessage(String value) {
    _$passwordMessageAtom.reportWrite(value, super.passwordMessage, () {
      super.passwordMessage = value;
    });
  }

  final _$confirmPasswordAtom =
      Atom(name: '_AuthenticationStore.confirmPassword');

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  final _$confirmPasswordMessageAtom =
      Atom(name: '_AuthenticationStore.confirmPasswordMessage');

  @override
  String get confirmPasswordMessage {
    _$confirmPasswordMessageAtom.reportRead();
    return super.confirmPasswordMessage;
  }

  @override
  set confirmPasswordMessage(String value) {
    _$confirmPasswordMessageAtom
        .reportWrite(value, super.confirmPasswordMessage, () {
      super.confirmPasswordMessage = value;
    });
  }

  final _$successAtom = Atom(name: '_AuthenticationStore.success');

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  final _$loggedInAtom = Atom(name: '_AuthenticationStore.loggedIn');

  @override
  bool get loggedIn {
    _$loggedInAtom.reportRead();
    return super.loggedIn;
  }

  @override
  set loggedIn(bool value) {
    _$loggedInAtom.reportWrite(value, super.loggedIn, () {
      super.loggedIn = value;
    });
  }

  final _$loadingAtom = Atom(name: '_AuthenticationStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$rememberMeAtom = Atom(name: '_AuthenticationStore.rememberMe');

  @override
  bool get rememberMe {
    _$rememberMeAtom.reportRead();
    return super.rememberMe;
  }

  @override
  set rememberMe(bool value) {
    _$rememberMeAtom.reportWrite(value, super.rememberMe, () {
      super.rememberMe = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_AuthenticationStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$showErrorAtom = Atom(name: '_AuthenticationStore.showError');

  @override
  bool get showError {
    _$showErrorAtom.reportRead();
    return super.showError;
  }

  @override
  set showError(bool value) {
    _$showErrorAtom.reportWrite(value, super.showError, () {
      super.showError = value;
    });
  }

  final _$registerAsyncAction = AsyncAction('_AuthenticationStore.register');

  @override
  Future<dynamic> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  final _$loginAsyncAction = AsyncAction('_AuthenticationStore.login');

  @override
  Future login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$forgotPasswordAsyncAction =
      AsyncAction('_AuthenticationStore.forgotPassword');

  @override
  Future<dynamic> forgotPassword() {
    return _$forgotPasswordAsyncAction.run(() => super.forgotPassword());
  }

  final _$logoutAsyncAction = AsyncAction('_AuthenticationStore.logout');

  @override
  Future<dynamic> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$_AuthenticationStoreActionController =
      ActionController(name: '_AuthenticationStore');

  @override
  void setUserId(String value) {
    final _$actionInfo = _$_AuthenticationStoreActionController.startAction(
        name: '_AuthenticationStore.setUserId');
    try {
      return super.setUserId(value);
    } finally {
      _$_AuthenticationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_AuthenticationStoreActionController.startAction(
        name: '_AuthenticationStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_AuthenticationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String value) {
    final _$actionInfo = _$_AuthenticationStoreActionController.startAction(
        name: '_AuthenticationStore.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$_AuthenticationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
username: ${username},
userMessage: ${userMessage},
password: ${password},
passwordMessage: ${passwordMessage},
confirmPassword: ${confirmPassword},
confirmPasswordMessage: ${confirmPasswordMessage},
success: ${success},
loggedIn: ${loggedIn},
loading: ${loading},
rememberMe: ${rememberMe},
errorMessage: ${errorMessage},
showError: ${showError},
canForgetPassword: ${canForgetPassword},
hasErrorsInLogin: ${hasErrorsInLogin},
hasErrorsInRegister: ${hasErrorsInRegister},
hasErrorInForgotPassword: ${hasErrorInForgotPassword}
    ''';
  }
}
