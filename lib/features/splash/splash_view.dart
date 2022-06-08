import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_for_isho/app/common/constants.dart';
import 'package:task_for_isho/app/common/util/exports.dart';
import 'package:task_for_isho/app/routes/app_pages.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () async {
      Get.offAndToNamed(Routes.LOGIN);
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
            child: const FlutterLogo(),
          ),
        ),
      ),
    );
  }
}
