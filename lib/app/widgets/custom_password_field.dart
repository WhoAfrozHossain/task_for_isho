import 'package:flutter/material.dart';
import 'package:task_for_isho/app/common/util/exports.dart';
import 'package:task_for_isho/app/common/util/validators.dart';

class PasswordFieldWidget extends StatelessWidget {
  final String? labelText, hintText;
  final String? initialValue, prefixText, suffixText;
  final FormFieldValidator<String?>? validator;
  final TextEditingController? controller;
  final ValueChanged<String?>? onChanged, onSaved;
  final bool readOnly, addHint, enabled;
  final Function() onObscureIconClick;
  final bool? isDense;
  final Function()? onTap;
  final InputBorder? border;
  final AutovalidateMode autovalidateMode;
  final BoxConstraints? suffixIconConstraints;
  final EdgeInsets? prefixIconPadding;
  final Color? fillColor;
  final bool obscureText;

  const PasswordFieldWidget({
    Key? key,
    this.labelText,
    this.hintText,
    this.controller,
    this.validator = Validators.validateEmpty,
    this.onChanged,
    required this.onObscureIconClick,
    this.onSaved,
    this.initialValue,
    this.readOnly = false,
    this.onTap,
    this.border,
    this.enabled = true,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.addHint = false,
    this.suffixIconConstraints,
    this.prefixText,
    this.suffixText,
    this.isDense,
    this.prefixIconPadding,
    this.fillColor,
    this.obscureText = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = AppTextStyle.regularStyle.copyWith(
      color: AppColors.mineShaft,
      fontSize: Dimens.fontSize15,
    );

    return TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      initialValue: initialValue,
      keyboardType: TextInputType.visiblePassword,
      autovalidateMode: autovalidateMode,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      enabled: enabled,
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: fillColor != null,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        isDense: isDense,
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        // alignLabelWithHint: maxLines == null,
        labelText: addHint
            ? null
            : ((controller?.text != null || !readOnly) ? labelText : null),
        labelStyle: const TextStyle(color: AppColors.doveGray),
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.doveGray),
        prefixIconConstraints: BoxConstraints(
          maxHeight: 40.h,
          maxWidth: 40.w,
        ),
        suffixIcon: IconButton(
          onPressed: onObscureIconClick,
          color: AppColors.kPrimaryColor,
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            size: 20.w,
          ),
        ),
        prefixText: prefixText,
        suffixText: suffixText,
        prefixStyle: textStyle,
        suffixStyle: textStyle,
        suffixIconConstraints: suffixIconConstraints ??
            BoxConstraints(
              maxHeight: 40.h,
              maxWidth: 40.w,
            ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:task_for_isho/app/common/util/exports.dart';
// import 'package:task_for_isho/app/common/util/validators.dart';
//
// class PasswordFieldWidget extends StatelessWidget {
//   final String? title, initialValue;
//   final TextEditingController? controller;
//   final bool obscureText;
//   final Function() onObscureIconClick;
//   final ValueChanged<String?>? onChanged, onSaved;
//   final Widget? prefixIcon;
//   final FormFieldValidator<String> validator;
//   final TextInputAction textInputAction;
//
//   const PasswordFieldWidget({
//     Key? key,
//     this.controller,
//     required this.obscureText,
//     required this.onObscureIconClick,
//     this.title,
//     this.onChanged,
//     this.onSaved,
//     this.initialValue,
//     this.validator = Validators.validatePassword,
//     this.textInputAction = TextInputAction.next,
//     this.prefixIcon,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       initialValue: initialValue,
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       obscureText: obscureText,
//       textInputAction: textInputAction,
//       validator: validator,
//       onChanged: onChanged,
//       onSaved: onSaved,
//       decoration: InputDecoration(
//         labelText: title,
//         prefixIcon: prefixIcon,
//         suffixIcon: IconButton(
//           onPressed: onObscureIconClick,
//           color: AppColors.kPrimaryColor,
//           icon: Icon(
//             obscureText ? Icons.visibility_off : Icons.visibility,
//             size: 20.w,
//           ),
//         ),
//       ),
//     );
//   }
// }
