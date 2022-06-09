// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  static const SPLASH = _Paths.SPLASH;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTRATION = _Paths.REGISTRATION;
  static const FORGET_PASSWORD = _Paths.FORGET_PASSWORD;
  static const PROPERTY_LIST = _Paths.PROPERTY_LIST;
}

abstract class _Paths {
  static const SPLASH = '/';
  static const LOGIN = '/login';
  static const REGISTRATION = '/registration';
  static const FORGET_PASSWORD = '/forget_password';
  static const PROPERTY_LIST = '/property_list';
}
