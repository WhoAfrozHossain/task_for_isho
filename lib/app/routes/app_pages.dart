import 'package:get/get.dart';
import 'package:task_for_isho/features/auth/bindings/auth_binding.dart';
import 'package:task_for_isho/features/auth/views/login.dart';

import '../../features/splash/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  const AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const Login(),
      binding: AuthBinding(),
      transition: Transition.fade,
    ),
  ];
}
