import 'package:get/get.dart';
import 'package:task_for_isho/features/auth/bindings/auth_binding.dart';
import 'package:task_for_isho/features/auth/views/forget_password.dart';
import 'package:task_for_isho/features/auth/views/login.dart';
import 'package:task_for_isho/features/auth/views/registration.dart';
import 'package:task_for_isho/features/property/bindings/property_binding.dart';
import 'package:task_for_isho/features/property/views/property_list.dart';
import '../../features/splash/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  const AppPages._();

  static const INITIAL = Routes.SPLASH;
  static const LOGIN = Routes.LOGIN;
  static const REGISTRATION = Routes.REGISTRATION;
  static const FORGET_PASSWORD = Routes.FORGET_PASSWORD;
  static const PROPERTY_LIST = Routes.PROPERTY_LIST;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const Login(),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.REGISTRATION,
      page: () => const Registration(),
      binding: AuthBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.FORGET_PASSWORD,
      page: () => const ForgetPassword(),
      binding: AuthBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.PROPERTY_LIST,
      page: () => const PropertyList(),
      binding: PropertyBinding(),
      transition: Transition.fade,
    ),
  ];
}
