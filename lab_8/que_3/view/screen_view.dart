import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/error_controller.dart';

class HomeView extends StatelessWidget {
  final ErrorController controller = Get.put(ErrorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetX SnackBar Example")),
      body: Center(
        child: ElevatedButton(
          onPressed: controller.triggerFormatException,
          child: Text("Trigger Error"),
        ),
      ),
    );
  }
}
