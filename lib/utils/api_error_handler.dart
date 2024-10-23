import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter/foundation.dart';

class ApiErrorHandler {
  static void handleError(int statusCode, String responseBody) {
    switch (statusCode) {
      case 400:
        debugPrint("Bad Request: $responseBody");
        Get.snackbar("Bad Request", responseBody);
        break;
      case 401:
        debugPrint("Unauthorized: $responseBody");
        Get.snackbar("Unauthorized", responseBody);
        break;
      case 403:
        debugPrint("Forbidden: $responseBody");
        Get.snackbar("Forbidden", responseBody);
        break;
      case 404:
        debugPrint("Not Found: $responseBody");
        Get.snackbar("Not Found", responseBody);
        break;
      case 500:
        debugPrint("Internal Server Error: $responseBody");
        Get.snackbar("Internal Server Error", responseBody);
        break;
      default:
        debugPrint("Unexpected Error: $responseBody");
        Get.snackbar("Unexpected Error", responseBody);
        break;
    }
  }
}
