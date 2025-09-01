import 'package:advance_flutter/lab_18/que_2/view/small_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/screen_controller.dart';
import 'large_screen.dart';

class ScreenView extends StatelessWidget {
  final ScreenController controller = Get.put(ScreenController());

  @override
  Widget build(BuildContext context) {
    controller.updateScreenSize(MediaQuery.of(context).size.width);

    return Scaffold(
      appBar: AppBar(title: const Text("Responsive For Phone and PC Both")),
      body: GetBuilder<ScreenController>(
        builder: (_) {
          return Center(
            child: controller.model.isSmallScreen
                ? const SmallScreenWidget()
                : const LargeScreenWidget(),
          );
        },
      ),
    );
  }
}
