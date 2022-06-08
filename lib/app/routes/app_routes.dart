// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  static const SPLASH = _Paths.SPLASH;
  static const LOGIN = _Paths.LOGIN;
}

abstract class _Paths {
  static const SPLASH = '/';
  static const LOGIN = '/login';
}
