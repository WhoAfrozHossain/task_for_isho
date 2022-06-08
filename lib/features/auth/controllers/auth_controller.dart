import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_for_isho/app/common/constants.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var passwordObsecure = true.obs;

  void onObsecureClick() {
    passwordObsecure.value = !passwordObsecure.value;
  }

  void onLoginClick() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      showSuccessToast('Successfully signed in');

      Get.offAndToNamed('/');
    } catch (e) {
      print(e.toString());
      showErrorToast('Error signing in');
    }
  }

  void onRegisterClick() async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      showSuccessToast('Successfully signed up');

      Get.offAndToNamed('/');
    } catch (e) {
      print(e.toString());
      showErrorToast('Error signing up');
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();

      showSuccessToast('Successfully signed out');

      Get.offAndToNamed('/');
    } catch (e) {
      print(e.toString());
      showErrorToast('Error signing out');
    }
  }
}
