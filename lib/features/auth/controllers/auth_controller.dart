import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_for_isho/app/common/constants.dart';
import 'package:task_for_isho/app/common/util/exports.dart';
import 'package:task_for_isho/app/routes/app_pages.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  var passwordObsecure = true.obs;
  var confirmPasswordObsecure = true.obs;

  void onObsecureClick() {
    passwordObsecure.value = !passwordObsecure.value;
  }

  void onConfirmObsecureClick() {
    confirmPasswordObsecure.value = !confirmPasswordObsecure.value;
  }

  void checkLoginStatus(bool canRouteChange) {
    if (auth.currentUser != null) {
      Get.offAllNamed(AppPages.PROPERTY_LIST);
    } else {
      if (canRouteChange) Get.offAllNamed(AppPages.LOGIN);
    }
  }

  void onLoginClick() async {
    try {
      await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      showSuccessToast('Successfully signed in');

      checkLoginStatus(false);

      emailController.clear();
      passwordController.clear();
    } catch (e) {
      print(e.toString());
      showErrorToast('Error signing in');
    }
  }

  String validationRegister() {
    String message = "";

    if (nameController.text.isEmpty) {
      if (message.isEmpty) {
        message = "Please enter your name";
      } else {
        message = "$message\nPlease enter your name";
      }
    }
    if (emailController.text.isEmpty) {
      if (message.isEmpty) {
        message = "Please enter your email";
      } else {
        message = "$message\nPlease enter your email";
      }
    } else if (!GetUtils.isEmail(emailController.text)) {
      if (message.isEmpty) {
        message = "Please enter valid email";
      } else {
        message = "$message\nPlease enter valid email";
      }
    }
    if (passwordController.text.isEmpty) {
      if (message.isEmpty) {
        message = "Please enter password";
      } else {
        message = "$message\nPlease enter password";
      }
    } else if (confirmPasswordController.text.isEmpty) {
      if (message.isEmpty) {
        message = "Please enter confirm password";
      } else {
        message = "$message\nPlease enter confirm password";
      }
    } else if (passwordController.text != confirmPasswordController.text) {
      if (message.isEmpty) {
        message = "Password and confirm password doesn't match";
      } else {
        message = "$message\nPassword and confirm password doesn't match";
      }
    }

    return message;
  }

  void onRegisterClick() async {
    String message = validationRegister();

    if (message.isEmpty) {
      try {
        await auth
            .createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        )
            .then((value) async {
          try {
            await fireStore.collection("users").doc(auth.currentUser?.uid).set({
              'id': auth.currentUser?.uid ?? "",
              'name': nameController.text,
              'email': emailController.text,
            });

            showSuccessToast('Successfully signed up');

            checkLoginStatus(false);
          } catch (e) {
            print(e);

            showErrorToast('Error signing up');
          }
        });
      } catch (e) {
        print(e.toString());
        showErrorToast('Error signing up');
      }
    } else {
      showErrorToast(message);
    }
  }

  void onForgetPasswordClick() async {
    try {
      await auth.sendPasswordResetEmail(email: emailController.text);

      showSuccessToast('Successfully mail sended');

      Get.back();
    } catch (e) {
      print(e.toString());
      showErrorToast('Error reset password');
    }
  }

  void signOut() async {
    try {
      await auth.signOut();

      showSuccessToast('Successfully signed out');

      checkLoginStatus(true);
    } catch (e) {
      print(e.toString());
      showErrorToast('Error signing out');
    }
  }
}
