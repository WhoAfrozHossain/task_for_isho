import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_for_isho/app/common/util/exports.dart';
import 'package:task_for_isho/app/widgets/custom_image_widget.dart';
import 'package:task_for_isho/app/widgets/custom_space_widget.dart';
import 'package:task_for_isho/app/widgets/custom_text_widget.dart';

class PropertyItemWidget extends StatelessWidget {
  const PropertyItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CustomImageWidget(
              imageUrl: '',
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextWidget(
                      text: "Title",
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                      isFullWidth: true,
                    ),
                    CustomTextWidget(
                      text: "\u09F3 1000",
                      fontWeight: FontWeight.bold,
                      fontSize: Dimens.fontSize14,
                      color: AppColors.kPrimaryColor,
                      isFullWidth: true,
                      align: TextAlign.right,
                    ),
                    CustomSpaceWidget(
                      height: 5,
                    ),
                    CustomTextWidget(
                      text: "Full Address",
                      fontSize: Dimens.fontSize14,
                      color: AppColors.black,
                      isFullWidth: true,
                      align: TextAlign.justify,
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
