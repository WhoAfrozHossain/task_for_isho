import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_for_isho/app/common/constants.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var passwordObsecure = true.obs;

  void onObsecureClick() {
    passwordObsecure.value = !passwordObsecure.value;
  }

  void onLoginClick() async {}

  void onRegisterClick() async {}

  void signOut() async {}
}
