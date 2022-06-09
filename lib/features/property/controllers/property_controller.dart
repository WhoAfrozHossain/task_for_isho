import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_for_isho/app/common/constants.dart';
import 'package:task_for_isho/features/auth/controllers/auth_controller.dart';

class PropertyController extends GetxController {
  AuthController authController = Get.put(AuthController());

  void signOut() async {
    authController.signOut();
  }
}
