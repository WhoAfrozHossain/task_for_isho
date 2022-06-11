import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:task_for_isho/app/common/util/exports.dart';
import 'package:task_for_isho/app/widgets/custom_appbar_widget.dart';
import 'package:task_for_isho/app/widgets/custom_image_widget.dart';
import 'package:task_for_isho/app/widgets/custom_inkwell_widget.dart';
import 'package:task_for_isho/app/widgets/custom_space_widget.dart';
import 'package:task_for_isho/app/widgets/custom_text_button.dart';
import 'package:task_for_isho/app/widgets/custom_text_field_widget.dart';
import 'package:task_for_isho/app/widgets/custom_text_widget.dart';
import 'package:task_for_isho/features/property/controllers/property_controller.dart';

class AddProperty extends GetView<PropertyController> {
  const AddProperty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbarWidget(
          addBackButton: true,
          title: Strings.addProperty,
          backbuttonColor: AppColors.white,
        ),
        backgroundColor: AppColors.lightGray,
        body: Obx(
          () => SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CustomTextFieldWidget(
                    controller: controller.propertyNameController,
                    keyboardType: TextInputType.text,
                    labelText: Strings.propertyName,
                    isDense: true,
                  ),
                  const CustomSpaceWidget(
                    height: 10,
                  ),
                  CustomTextFieldWidget(
                    controller: controller.rentController,
                    keyboardType: TextInputType.number,
                    labelText: Strings.propertyRent,
                    isDense: true,
                  ),
                  const CustomSpaceWidget(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextWidget(
                        text: Strings.selectedImages,
                        color: AppColors.black,
                        fontSize: Dimens.fontSize16,
                        align: TextAlign.left,
                        fontWeight: FontWeight.bold,
                      ),
                      controller.totalImage.value > 0
                          ? CustomInkwellWidget(
                              onTap: () {
                                Utils.showImagePicker(onGetImage: (file) {
                                  controller.getPropertyImages(file);
                                });
                              },
                              child: CustomTextWidget(
                                text: Strings.addMore,
                                color: AppColors.kPrimaryColor,
                                fontSize: Dimens.fontSize16,
                                align: TextAlign.center,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                  const CustomSpaceWidget(
                    height: 10,
                  ),
                  controller.totalImage.value == 0
                      ? Container(
                          width: Get.width,
                          height: 150,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomTextWidget(
                                text: Strings.noImageSelected,
                                color: AppColors.doveGray,
                                fontSize: Dimens.fontSize14,
                                align: TextAlign.center,
                              ),
                              const CustomSpaceWidget(
                                height: 10,
                              ),
                              CustomInkwellWidget(
                                onTap: () {
                                  Utils.showImagePicker(
                                      onGetImage: controller.getPropertyImages);
                                },
                                child: CustomTextWidget(
                                  text: Strings.uploadPhotos,
                                  color: AppColors.kPrimaryColor,
                                  fontSize: Dimens.fontSize16,
                                  align: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: .9,
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: controller.propertyImage.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Stack(
                              children: [
                                CustomImageWidget(
                                  borderRadius: BorderRadius.circular(5),
                                  height: Get.height,
                                  imageUrl: controller.propertyImage[index],
                                ),
                                Positioned(
                                  top: -5,
                                  left: -5,
                                  child: IconButton(
                                    onPressed: () {
                                      controller.removePropertyImages(index);
                                    },
                                    icon: const Icon(
                                      Icons.cancel,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                  const CustomSpaceWidget(
                    height: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: SizedBox(
                        width: Get.width,
                        child: GoogleMap(
                          mapType: MapType.normal,
                          initialCameraPosition: controller.kGooglePlex!,
                          gestureRecognizers:
                              <Factory<OneSequenceGestureRecognizer>>{
                            Factory<OneSequenceGestureRecognizer>(
                              () => EagerGestureRecognizer(),
                            ),
                          },
                          markers: <Marker>{
                            Marker(
                              markerId: const MarkerId('SomeId'),
                              position: controller.currentLocation.value,
                            )
                          },
                          onMapCreated: (GoogleMapController gMapController) {
                            controller.mapController.complete(gMapController);
                          },
                          onTap: controller.selectedMapPosition,
                        ),
                      ),
                    ),
                  ),
                  const CustomSpaceWidget(
                    height: 30,
                  ),
                  CustomTextButton(
                    onPressed: controller.submitCreateProperty,
                    title: Strings.submit,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
