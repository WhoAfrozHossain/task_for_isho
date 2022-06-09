import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_for_isho/app/common/util/exports.dart';
import 'package:task_for_isho/features/auth/controllers/auth_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () async {
      authController.checkLoginStatus(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: FractionallySizedBox(
          widthFactor: .5,
          child: SizedBox(
            width: Get.width,
            child: const FlutterLogo(
              size: 500,
            ),
          ),
        ),
      ),
    );
  }
}
