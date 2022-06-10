import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';
import 'package:task_for_isho/app/common/constants.dart';
import 'package:task_for_isho/app/common/util/exports.dart';

// ignore: must_be_immutable
class CustomImageWidget extends StatelessWidget {
  String? imageUrl;
  final Size? size;
  final double? height, radius;
  final BorderRadius? borderRadius;
  final Color? color;

  CustomImageWidget({
    Key? key,
    required this.imageUrl,
    this.size,
    this.radius,
    this.borderRadius,
    this.color,
    this.height,
  })  : assert(
          borderRadius == null || radius == null,
          'Cannot provide both a borderRadius and a radius\n',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageUrl!.contains("public")) {
      if (!imageUrl!.contains("http")) {
        imageUrl = Constants.imageBaseUrl + imageUrl!;
      }
    }

    return (radius != null || borderRadius != null)
        ? ClipRRect(
            borderRadius: borderRadius ?? radius?.borderRadius,
            child: child,
          )
        : child;
  }

  Widget get child =>
      imageUrl == null || (imageUrl != null && imageUrl!.isEmpty)
          ? placeholder
          : (GetUtils.isURL(imageUrl ?? Constants.dummyImageUrl) ||
                  imageUrl!.startsWith('https') ||
                  imageUrl!.startsWith('http')
              ? OctoImage(
                  image: CachedNetworkImageProvider(
                    imageUrl ?? Constants.dummyImageUrl,
                  ),
                  placeholderBuilder: OctoPlaceholder.blurHash(
                    Constants.placeHolderBlurHash,
                  ),
                  // progressIndicatorBuilder: (context, progress) {
                  //   double? value;
                  //   if (progress != null && progress.expectedTotalBytes != null) {
                  //     value = progress.cumulativeBytesLoaded /
                  //         progress.expectedTotalBytes!;
                  //   }
                  //   return CircularProgressIndicator(value: value);
                  // },
                  errorBuilder: (context, error, stackTrace) {
                    return placeholder;
                  },
                  fit: BoxFit.cover,
                  width: Get.width,
                  // width: size?.width.w,
                  // height: height?.w ?? size?.height.w,
                  color: color,
                )
              : (File(imageUrl!).existsSync()
                  ? Image.file(
                      File(imageUrl!),
                      width: size?.width.w,
                      height: height?.w ?? size?.height.w,
                      fit: BoxFit.fitWidth,
                    )
                  : placeholder));

  Widget get placeholder => Icon(
        Icons.error,
        size: size?.width.w,
      );
}
