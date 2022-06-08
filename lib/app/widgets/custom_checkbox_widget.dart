import 'package:flutter/material.dart';
import 'package:task_for_isho/app/common/util/validators.dart';

class CustomCheckboxWidget extends FormField<bool> {
  CustomCheckboxWidget({
    Key? key,
    required bool value,
    // required FormFieldSetter<bool> onSaved,
    Function(bool?)? onChanged,
    required Widget titleWidget,
    bool? isDense,
  }) : super(
          key: key,
          initialValue: value,
          // onSaved: onSaved,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (v) => Validators.validateCheckbox(v: v!),
          builder: (state) {
            return CheckboxListTile(
              dense: isDense ?? state.hasError,
              value: state.value,
              contentPadding: EdgeInsets.zero,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: onChanged,
              title: titleWidget,
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
