import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:task_for_isho/app/common/util/exports.dart';

class Constants {
  const Constants._();

  static const String baseUrl = '';
  static const String imageBaseUrl = '';

  static const timeout = Duration(minutes: 1);

  static const String dummyImageUrl =
      'https://i.picsum.photos/id/1084/536/354.jpg'
      '?grayscale&hmac=Ux7nzg19e1q35mlUVZjhCLxqkR30cC-CarVg-nlIf60';
  static const String placeHolderBlurHash = 'LEHV6nWB2yk8pyo0adR*.7kCMdnj';
}

// show error message using toast
showErrorToast(String message) {
  if (message != "") {
    BotToast.showText(
        text: message,
        contentColor: Colors.red,
        textStyle: const TextStyle(
          letterSpacing: 0.3,
          color: AppColors.white,
          fontSize: 15,
        ),
        duration: const Duration(seconds: 3));
  }
}

// show success message using toast
showSuccessToast(String message) {
  if (message != "") {
    BotToast.showText(
        text: message,
        textStyle: const TextStyle(
          color: AppColors.white,
          fontSize: 14,
        ),
        contentColor: Colors.green);
  }
}

// checkInternet(Function() requestDidSaved) async {
//   var connectivityResult = await (Connectivity().checkConnectivity());
//   if (connectivityResult == ConnectivityResult.none) {
//     Get.toNamed('/no_internet').then((value) {
//       checkInternet(requestDidSaved);
//     });
//   } else {
//     requestDidSaved();
//   }
// }

class ResponseObject {
  int id;
  Object object;

  ResponseObject(
      {this.id = ResponseCode.NO_INTERNET_CONNECTION, required this.object});
}

class APIResponseCode {
  // ignore: constant_identifier_names
  static const int OK = 200;
  // ignore: constant_identifier_names
  static const int CREATED = 201;
  // ignore: constant_identifier_names
  static const int BAD_REQUEST = 400;
  // ignore: constant_identifier_names
  static const int NOT_FOUND = 404;
  // ignore: constant_identifier_names
  static const int INTERNAL_SERVER_ERROR = 500;
  // ignore: constant_identifier_names
  static const int UNAUTHORIZED_ERROR = 401;
}

class ResponseCode {
  // ignore: constant_identifier_names
  static const int NO_INTERNET_CONNECTION = 0;
  // ignore: constant_identifier_names
  static const int AUTHORIZATION_FAILED = 401;
  // ignore: constant_identifier_names
  static const int SUCCESSFUL = 500;
  // ignore: constant_identifier_names
  static const int FAILED = 501;
  // ignore: constant_identifier_names
  static const int NOT_FOUND = 502;
}
