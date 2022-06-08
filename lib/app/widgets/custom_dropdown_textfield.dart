import 'package:flutter/material.dart';
import 'package:task_for_isho/app/common/util/exports.dart';
import 'package:task_for_isho/app/common/util/validators.dart';

class CustomDropdownTextField<T> extends StatelessWidget {
  final String title;
  final ValueChanged<T?> onChanged;
  final FormFieldSetter<T>? onSaved;
  final List<T> dataList;
  final String Function(T data)? item;
  final double? width;
  final T? value;
  final double? textFontSize;
  final Widget? prefixIcon;

  const CustomDropdownTextField({
    Key? key,
    required this.title,
    required this.dataList,
    required this.item,
    required this.onChanged,
    this.onSaved,
    this.width,
    this.value,
    this.textFontSize,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return dataList.isNotEmpty
        ? Row(
            children: [
              if (prefixIcon != null)
                SizedBox(
                  height: 40.h,
                  width: 40.w,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: prefixIcon,
                  ),
                ),
              Expanded(
                child: SizedBox(
                  width: width?.w,
                  child: DropdownButtonFormField<T>(
                    isExpanded: true,
                    icon: const Icon(Icons.arrow_drop_down),
                    value: value,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: value == null ? '' : item!(value!),
                      labelText: title,
                      hintStyle: AppTextStyle.regularStyle.copyWith(
                        fontSize: textFontSize ?? Dimens.fontSize14,
                        color: AppColors.mineShaft,
                      ),
                      floatingLabelBehavior: value == null || item == null
                          ? FloatingLabelBehavior.never
                          : FloatingLabelBehavior.always,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: prefixIcon == null ? 12.w : 0),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: Validators.validateTEmpty,
                    onChanged: onChanged,
                    onSaved: onSaved,
                    items: dataList
                        .map<DropdownMenuItem<T>>(
                          (e) => DropdownMenuItem<T>(
                            value: e,
                            child: Text(
                              item!(e),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle.regularStyle.copyWith(
                                fontSize: textFontSize ?? Dimens.fontSize14,
                                color: AppColors.mineShaft,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
