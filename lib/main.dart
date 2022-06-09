import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_for_isho/app/common/util/initializer.dart';
import 'package:task_for_isho/app/common/values/strings.dart';
import 'package:task_for_isho/app/common/values/styles/theme.dart';
import 'package:task_for_isho/app/routes/app_pages.dart';
import 'package:task_for_isho/features/auth/bindings/auth_binding.dart';

void main() {
  Initializer.instance.init(() {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: Get.width,
        maxHeight: Get.height,
      ),
      designSize: Get.size,
    );

    return GetMaterialApp(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      initialRoute: AppPages.INITIAL,
      initialBinding: AuthBinding(),
      getPages: AppPages.routes,
    );
  }
}
