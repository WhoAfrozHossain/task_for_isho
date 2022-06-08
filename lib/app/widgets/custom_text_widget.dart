import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_for_isho/app/common/util/exports.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  final TextAlign? align;
  final int? maxLine;
  final bool? isFullWidth;

  const CustomTextWidget({
    Key? key,
    required this.text,
    this.fontWeight,
    this.color,
    this.fontSize,
    this.align,
    this.maxLine,
    this.isFullWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
      constraints: BoxConstraints(
        minWidth: isFullWidth == null
            ? 0
            : isFullWidth!
                ? Get.width
                : 10,
      ),
      child: Text(
        text,
        maxLines: maxLine ?? 1,
        style: TextStyle(
          fontWeight: fontWeight ?? FontWeight.normal,
          color: color ?? AppColors.doveGray,
          fontSize: fontSize ?? Dimens.fontSize18,
        ),
        textAlign: align ?? TextAlign.justify,
      ),
    );
  }
}
