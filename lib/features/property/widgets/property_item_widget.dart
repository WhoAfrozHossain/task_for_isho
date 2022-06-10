import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_for_isho/app/common/util/exports.dart';
import 'package:task_for_isho/app/models/property_model.dart';
import 'package:task_for_isho/app/widgets/custom_image_widget.dart';
import 'package:task_for_isho/app/widgets/custom_space_widget.dart';
import 'package:task_for_isho/app/widgets/custom_text_widget.dart';
import 'package:task_for_isho/features/property/controllers/property_controller.dart';

class PropertyItemWidget extends GetView<PropertyController> {
  final PropertyModel item;
  const PropertyItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.selectProperty(item);
      },
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: AspectRatio(
                aspectRatio: 1,
                child: CustomImageWidget(
                  borderRadius: BorderRadius.circular(10),
                  imageUrl: item.images?.first ?? "",
                ),
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
                        text: item.propertyName ?? "",
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                        isFullWidth: true,
                      ),
                      CustomTextWidget(
                        text: "\u09F3 ${item.propertyRent ?? ""}",
                        fontWeight: FontWeight.bold,
                        fontSize: Dimens.fontSize14,
                        color: AppColors.kPrimaryColor,
                        isFullWidth: true,
                        align: TextAlign.right,
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
