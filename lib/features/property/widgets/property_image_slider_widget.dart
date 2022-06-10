import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_for_isho/app/common/util/exports.dart';
import 'package:task_for_isho/app/widgets/custom_image_widget.dart';
import 'package:task_for_isho/app/widgets/custom_text_widget.dart';

class PropertyImageSliderWidget extends StatelessWidget {
  final List<String> slider;

  const PropertyImageSliderWidget({
    Key? key,
    required this.slider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 1,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        viewportFraction: 1,
        reverse: true,
        autoPlay: true,
      ),
      items: slider.map((String item) {
        return SizedBox(
          width: Get.width,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              CustomImageWidget(imageUrl: item),
              Positioned(
                bottom: 5,
                right: 5,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.kPrimaryColor.withOpacity(.7),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: CustomTextWidget(
                    text: "${slider.indexOf(item) + 1}/${slider.length}",
                    color: AppColors.lightGray,
                    fontSize: Dimens.fontSize14,
                    align: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
