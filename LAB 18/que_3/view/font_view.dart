import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/font_controller.dart';

class FontView extends StatelessWidget {
  final FontController controller = Get.put(FontController());

  @override
  Widget build(BuildContext context) {
    controller.updateScreenWidth(MediaQuery.of(context).size.width);
    return Scaffold(
      appBar: AppBar(title: const Text("Dynamic Font Size")),
      body: GetBuilder<FontController>(
        builder:(_) {
          return Center(
            child: Text(
              " This Text is Responsive For All Devices ",
              style: TextStyle(
                fontSize: controller.model.fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlueAccent
            ),
            ),
          );
        },
      ),
    );
  }
}
