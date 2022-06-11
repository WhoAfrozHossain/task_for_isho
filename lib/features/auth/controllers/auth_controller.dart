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

  String validationLogin() {
    String message = "";

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
    }

    return message;
  }

  void onLoginClick() async {
    String message = validationLogin();

    if (message.isEmpty) {
      try {
        Utils.loadingDialog();

        await auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        emailController.clear();
        passwordController.clear();

        checkLoginStatus(false);

        Utils.closeDialog();

        showSuccessToast('Successfully signed in');
      } catch (e) {
        Utils.closeDialog();
        showErrorToast('Error signing in');
      }
    } else {
      showErrorToast(message);
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
        Utils.loadingDialog();

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

            Utils.closeDialog();

            showSuccessToast('Successfully signed up');

            checkLoginStatus(false);
          } catch (e) {
            Utils.closeDialog();

            showErrorToast('Error signing up');
          }
        });
      } catch (e) {
        Utils.closeDialog();
        showErrorToast('Error signing up');
      }
    } else {
      showErrorToast(message);
    }
  }

  void onForgetPasswordClick() async {
    String message = "";

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

    if (message.isEmpty) {
      try {
        Utils.closeDialog();

        await auth.sendPasswordResetEmail(email: emailController.text);

        Utils.closeDialog();

        showSuccessToast('Successfully mail send');

        Get.back();
      } catch (e) {
        Utils.closeDialog();
        showErrorToast('Error reset password');
      }
    } else {
      showErrorToast(message);
    }
  }

  void signOut() async {
    try {
      Utils.closeDialog();

      await auth.signOut();

      Utils.closeDialog();

      showSuccessToast('Successfully signed out');

      checkLoginStatus(true);
    } catch (e) {
      Utils.closeDialog();
      showErrorToast('Error signing out');
    }
  }
}
