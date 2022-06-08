import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDrawerWidget extends StatelessWidget {
  String? imageUrl, name, phoneNumber;

  CustomDrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // controller.notifyChanges();
    //
    // if (controller.token.value.isNotEmpty &&
    //     controller.tutor.value &&
    //     controller.teacherDashboard.value.teacher != null) {
    //   imageUrl = controller.teacherDashboard.value.teacher!.image;
    //   name = controller.teacherDashboard.value.teacher!.fullName;
    //   phoneNumber = controller.teacherDashboard.value.teacher!.phoneNumber;
    // }
    //
    // if (controller.token.value.isNotEmpty &&
    //     !controller.tutor.value &&
    //     controller.candidateDashboard.value.auth != null) {
    //   imageUrl = controller.candidateDashboard.value.auth!.image;
    //   name = controller.candidateDashboard.value.auth!.fullName;
    //   phoneNumber = controller.candidateDashboard.value.auth!.phoneNumber;
    // }

    return SafeArea(
      child: Drawer(
          // child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     if (controller.token.value.isNotEmpty)
          //       CustomDrawerHeader(
          //         imageUrl: imageUrl,
          //         name: name,
          //         mobileNumber: phoneNumber,
          //       ),
          //     if (controller.token.value.isNotEmpty)
          //       Padding(
          //         padding: EdgeInsets.symmetric(horizontal: 15.w),
          //         child: Divider(
          //           thickness: 2.w,
          //           color: AppColors.doveGray.withOpacity(0.5),
          //         ),
          //       ),
          //     Expanded(
          //       child: ListView(
          //         padding: EdgeInsets.zero,
          //         physics: const BouncingScrollPhysics(),
          //         children: [
          //           if (controller.token.value.isNotEmpty)
          //             CustomListTileWidget(
          //               title: Strings.dashboard,
          //               onTap: controller.onDashboardClick,
          //             ),
          //           if (controller.token.value.isNotEmpty)
          //             CustomListTileWidget(
          //               title: Strings.myProfile,
          //               onTap: controller.onMyProfileClick,
          //             ),
          //           if (controller.tutor.value)
          //             CustomListTileWidget(
          //               title: Strings.changePassword,
          //               onTap: () {
          //                 controller.selectedProfileEditTab(4);
          //                 Get.offAndToNamed(Routes.TUTOR_PROFILE_EDIT_VIEW);
          //               },
          //             ),
          //           // if (controller.token.value.isNotEmpty &&
          //           //     controller.tutor.value)
          //           //   CustomListTileWidget(
          //           //     title: Strings.editProfile,
          //           //     onTap: controller.onEditProfileClick,
          //           //   ),
          //           if (controller.token.value.isNotEmpty)
          //             Padding(
          //               padding: EdgeInsets.symmetric(horizontal: 15.w),
          //               child: Divider(
          //                 thickness: 2.w,
          //                 color: AppColors.doveGray.withOpacity(0.5),
          //               ),
          //             ),
          //           CustomListTileWidget(
          //             title: Strings.home,
          //             onTap: controller.onHomeClick,
          //           ),
          //           if (!controller.tutor.value)
          //             CustomListTileWidget(
          //               title: Strings.tutorList,
          //               onTap: controller.searchData,
          //             ),
          //           if (!controller.tutor.value)
          //             CustomListTileWidget(
          //               title: Strings.hireTutor,
          //               onTap: controller.onPremiumTutorsClick,
          //             ),
          //           // if (!controller.tutor.value)
          //           //   CustomListTileWidget(
          //           //     title: Strings.joinAsTutor,
          //           //     onTap: () {
          //           //       Get.offAndToNamed(Routes.TUTOR_REGISTRATION);
          //           //     },
          //           //   ),
          //           // if (!controller.tutor.value)
          //           //   CustomListTileWidget(
          //           //     title: Strings.tutorLogin,
          //           //     onTap: () {
          //           //       Get.offAndToNamed(Routes.TUTOR_LOGIN);
          //           //     },
          //           //   ),
          //           // CustomListTileWidget(
          //           //   title: Strings.premiumTutors,
          //           //   onTap: controller.onPremiumTutorsClick,
          //           // ),
          //           // CustomListTileWidget(
          //           //   title: Strings.requestForTutor,
          //           //   onTap: controller.onRequestForTutorClick,
          //           // ),
          //           // CustomListTileWidget(
          //           //   title: Strings.tutionJobs,
          //           //   onTap: controller.onTutionJobsClick,
          //           // ),
          //           CustomListTileWidget(
          //             title: Strings.howItWorks,
          //             onTap: controller.onHowItWorksClick,
          //           ),
          //           Padding(
          //             padding: EdgeInsets.symmetric(horizontal: 15.w),
          //             child: Divider(
          //               thickness: 2.w,
          //               color: AppColors.doveGray.withOpacity(0.5),
          //             ),
          //           ),
          //           CustomListTileWidget(
          //             title: Strings.contactUs,
          //             onTap: controller.onContactUsClick,
          //           ),
          //           CustomListTileWidget(
          //             title: Strings.shareApp,
          //             onTap: controller.onShareAppClick,
          //           ),
          //           CustomListTileWidget(
          //             title: Strings.rateApp,
          //             onTap: controller.onRateAppClick,
          //           ),
          //           CustomListTileWidget(
          //             title: Strings.privacyPolicy,
          //             onTap: controller.onPrivacyPolicyClick,
          //           ),
          //           CustomListTileWidget(
          //             title: Strings.website,
          //             onTap: controller.onWebsiteClick,
          //           ),
          //           CustomListTileWidget(
          //             title: Strings.aboutUs,
          //             onTap: controller.onAboutUsClick,
          //           ),
          //           Obx(
          //             () =>
          //                 controller.socialIcons.value.socialicons?.isNotEmpty ??
          //                         false
          //                     ? CustomDrawerSocialIcons(
          //                         socialIconsModel: controller.socialIcons.value,
          //                       )
          //                     : Container(),
          //           ),
          //         ],
          //       ),
          //     ),
          //     if (controller.token.value.isNotEmpty)
          //       CustomListTileWidget(
          //         title: Strings.logOut,
          //         trailing: const SizedBox(),
          //         onTap: controller.onLogoutClick,
          //       ),
          //   ],
          // ),
          ),
    );
  }
}
