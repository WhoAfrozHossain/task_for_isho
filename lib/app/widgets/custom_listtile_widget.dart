import 'package:flutter/material.dart';
import 'package:task_for_isho/app/common/util/exports.dart';

class CustomListTileWidget extends StatelessWidget {
  final String title;
  final Function() onTap;
  final Widget? trailing;

  const CustomListTileWidget({
    Key? key,
    required this.title,
    required this.onTap,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title.toUpperCase(),
        style: AppTextStyle.semiBoldStyle.copyWith(
          color: AppColors.black,
          fontSize: Dimens.fontSize15,
        ),
      ),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios_sharp),
    );
  }
}
