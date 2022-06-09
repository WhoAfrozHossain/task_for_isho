import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_for_isho/app/common/util/exports.dart';
import 'package:task_for_isho/app/widgets/custom_appbar_widget.dart';
import 'package:task_for_isho/features/property/controllers/property_controller.dart';

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
      backgroundColor: AppColors.lightGray,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [],
          ),
        ),
      ),
    );
  }
}
