// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:task_for_isho/app/data/interface_controller/api_interface_controller.dart';
// import 'package:task_for_isho/app/features/widgets/custom_retry_widget.dart';
//
// export 'package:task_for_isho/app/common/util/exports.dart';
//
// class BaseWidget extends StatelessWidget {
//   ///A widget with only custom retry button widget.
//   final Widget child;
//
//   const BaseWidget({
//     Key? key,
//     required this.child,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ApiInterfaceController>(
//       builder: (c) => Stack(
//         children: [
//           Positioned.fill(
//             child: child,
//           ),
//           Visibility(
//             visible: c.retry != null && c.error != null,
//             child: Positioned.fill(
//               child: Scaffold(
//                 body: CustomRetryWidget(
//                   onPressed: c.onRetryTap,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
