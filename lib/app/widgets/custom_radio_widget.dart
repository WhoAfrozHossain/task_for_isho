import 'package:flutter/material.dart';
import 'package:task_for_isho/app/common/util/exports.dart';
import 'custom_text_widget.dart';

class CustomRadioWidget extends FormField<bool> {
  CustomRadioWidget({
    Key? key,
    required String value,
    required String groupValue,
    required String title,
    required void Function(dynamic value) onChange,
  }) : super(
          key: key,
          builder: (state) {
            return RadioListTile(
              dense: state.hasError,
              value: value,
              groupValue: groupValue,
              onChanged: onChange,
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              title: CustomTextWidget(
                text: title,
                fontSize: Dimens.fontSize14,
              ),
              subtitle: state.hasError
                  ? Builder(
                      builder: (_) => Text(
                        state.errorText!,
                        style: TextStyle(color: Theme.of(_).errorColor),
                      ),
                    )
                  : null,
            );
          },
        );
}
