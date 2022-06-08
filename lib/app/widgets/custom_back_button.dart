import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_for_isho/app/common/util/exports.dart';

class CustomIconButton extends StatelessWidget {
  final Widget? leading;
  final Function()? onTap;
  final Color? buttonColor;

  const CustomIconButton({
    Key? key,
    this.leading,
    this.onTap,
    this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap ?? () => Get.back(),
      icon: leading ??
          Icon(
            Icons.arrow_back,
            color: buttonColor ?? Get.theme.primaryIconTheme.color,
          ).paddingOnly(left: 10.w),
    );
  }
}
