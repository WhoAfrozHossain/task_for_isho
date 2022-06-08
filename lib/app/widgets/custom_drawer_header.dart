import 'package:flutter/material.dart';
import 'package:task_for_isho/app/common/util/exports.dart';
import 'custom_image_widget.dart';
import 'custom_row_text_widget.dart';

class CustomDrawerHeader extends StatelessWidget {
  // final FrontendController controller = Get.put(FrontendController());

  final String? imageUrl, name, mobileNumber;

  const CustomDrawerHeader({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.mobileNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15.w, 15.w, 15.w, 7.w),
      child: Row(
        children: [
          SizedBox(
            height: 60,
            width: 60,
            child: ClipRRect(
              borderRadius: 5.borderRadius,
              child: CustomImageWidget(
                imageUrl: imageUrl != null && imageUrl != ""
                    ? imageUrl
                    : 'https://dummyimage.com/600x400/000/fff.jpg',
              ),
              // child: FadeInImage.assetNetwork(
              //   placeholder: AppImages.icGallery,
              //   width: 60.w,
              //   height: 60.w,
              //   fit: BoxFit.cover,
              //   image: controller.tutor.value
              //       ? controller.teacherDashboard.value.teacher!.image!
              //       : 'https://dummyimage.com/600x400/000/fff.jpg',
              //   imageErrorBuilder: (_, e, s) => const Icon(Icons.offline_bolt),
              // ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name ?? "",
                    style: AppTextStyle.semiBoldStyle.copyWith(
                      fontSize: Dimens.fontSize16,
                    ),
                  ),
                  SizedBox(height: 4.w),
                  CustomRowTextWidget(
                    title: mobileNumber ?? "",
                    subtitle: '',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
