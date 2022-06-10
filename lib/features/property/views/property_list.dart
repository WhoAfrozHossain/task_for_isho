import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_for_isho/app/common/util/exports.dart';
import 'package:task_for_isho/app/routes/app_pages.dart';
import 'package:task_for_isho/app/widgets/custom_appbar_widget.dart';
import 'package:task_for_isho/app/widgets/custom_space_widget.dart';
import 'package:task_for_isho/app/widgets/custom_text_widget.dart';
import 'package:task_for_isho/features/property/controllers/property_controller.dart';
import 'package:task_for_isho/features/property/widgets/property_item_widget.dart';

class PropertyList extends GetView<PropertyController> {
  const PropertyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(
        addBackButton: false,
        title: Strings.propertyList,
        actions: [
          IconButton(
            onPressed: controller.signOut,
            icon: const Icon(
              Icons.logout,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed(AppPages.ADD_PROPERTY);
        },
        label: Text(Strings.addProperty),
        icon: Icon(Icons.add_rounded),
        backgroundColor: AppColors.kPrimaryColor,
      ),
      backgroundColor: AppColors.lightGray,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Obx(
            () => Column(children: [
              CustomTextWidget(
                text: "Welcome ${controller.user.value.name ?? ""}",
                color: AppColors.black,
                fontWeight: FontWeight.w500,
              ),
              const CustomSpaceWidget(
                height: 20,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: controller.properties.value.length,
                separatorBuilder: (_, index) {
                  return const CustomSpaceWidget(
                    height: 15,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return PropertyItemWidget(
                    item: controller.properties[index],
                  );
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
