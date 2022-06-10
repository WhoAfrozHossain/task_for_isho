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
import 'package:task_for_isho/features/property/widgets/property_image_slider_widget.dart';
import 'package:task_for_isho/features/property/widgets/property_item_widget.dart';

class ViewProperty extends GetView<PropertyController> {
  const ViewProperty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbarWidget(
          addBackButton: true,
          title: Strings.viewProperty,
          backbuttonColor: AppColors.white,
        ),
        backgroundColor: AppColors.lightGray,
        body: Obx(
          () => SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  PropertyImageSliderWidget(
                    slider: controller.selectedProperty.value.images ?? [],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        CustomTextWidget(
                          text:
                              controller.selectedProperty.value.propertyName ??
                                  "",
                          color: AppColors.black,
                          fontSize: Dimens.fontSize16,
                          align: TextAlign.left,
                          fontWeight: FontWeight.bold,
                          isFullWidth: true,
                        ),
                        CustomTextWidget(
                          text:
                              "\u09F3 ${controller.selectedProperty.value.propertyRent ?? ""}",
                          fontWeight: FontWeight.bold,
                          fontSize: Dimens.fontSize14,
                          color: AppColors.kPrimaryColor,
                          isFullWidth: true,
                          align: TextAlign.right,
                        ),
                        CustomSpaceWidget(
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
                                initialCameraPosition: CameraPosition(
                                  target: LatLng(
                                      controller.selectedProperty.value.lat ??
                                          0,
                                      controller.selectedProperty.value.lng ??
                                          0),
                                  zoom: 14,
                                ),
                                gestureRecognizers:
                                    <Factory<OneSequenceGestureRecognizer>>[
                                  new Factory<OneSequenceGestureRecognizer>(
                                    () => new EagerGestureRecognizer(),
                                  ),
                                ].toSet(),
                                markers: <Marker>{
                                  Marker(
                                    markerId: const MarkerId('SomeId'),
                                    position: LatLng(
                                        controller.selectedProperty.value.lat ??
                                            0,
                                        controller.selectedProperty.value.lng ??
                                            0),
                                  )
                                },
                                onMapCreated:
                                    (GoogleMapController gMapController) {
                                  // controller.mapController
                                  //     .complete(gMapController);
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
