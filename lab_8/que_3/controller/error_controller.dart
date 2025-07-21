import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ErrorController extends GetxController {
  void triggerFormatException() {
    try {
      int.parse("vir OD"); // FormatException
    } on FormatException catch (e) {
      showError("Format Error: ${e.message}");
    } catch (e) {
      showError("Unknown Error: $e");
    }
  }

  void showError(String message) {
    Get.snackbar(
      "Error",
      message,
      backgroundColor: Colors.blue.shade100,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
