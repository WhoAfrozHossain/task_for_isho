import 'package:flutter/material.dart';
import 'package:task_for_isho/app/common/util/exports.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? title;
  final double height;
  final double? buttonWidth, textFontSize;
  final Widget? child;
  final Color buttonColor;
  final bool addBorder;
  final double radius;

  const CustomTextButton({
    Key? key,
    required this.onPressed,
    this.title,
    this.height = 40,
    this.child,
    this.buttonColor = AppColors.kPrimaryColor,
    this.buttonWidth,
    this.textFontSize,
    this.addBorder = false,
    this.radius = 12,
  })  : assert(
          title == null || child == null,
          'Cannot provide both a title and a child\n'
          'To provide both, use "child: Text(title)".',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: AppTheme.theme.textButtonTheme.style!.copyWith(
        minimumSize: MaterialStateProperty.resolveWith<Size>(
          (states) => buttonWidth == null
              ? Size.fromHeight(height.h)
              : Size(
                  buttonWidth!,
                  height.h,
                ),
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return buttonColor == Colors.transparent ||
                      buttonColor == Colors.white
                  ? AppColors.kPrimaryColor.withOpacity(.24)
                  : Colors.white.withOpacity(.14);
            }

            return null;
          },
        ),
        shape: addBorder
            ? MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
                (states) => RoundedRectangleBorder(
                  borderRadius: radius.borderRadius,
                  side: BorderSide(
                    color: AppColors.kPrimaryColor,
                    width: 1.w,
                  ),
                ),
              )
            : AppTheme.theme.textButtonTheme.style!.shape,
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.doveGray;
            }

            return buttonColor;
          },
        ),
      ),
      child: child ??
          Text(
            title!,
            style: AppTextStyle.buttonTextStyle.copyWith(
              fontSize: textFontSize ?? Dimens.fontSize16,
              color: buttonColor == Colors.white ||
                      buttonColor == Colors.transparent
                  ? AppColors.kPrimaryColor
                  : Colors.white,
            ),
          ),
    );
  }
}
