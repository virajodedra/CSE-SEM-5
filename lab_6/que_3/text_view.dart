import 'package:advance_flutter/lab_6/que_3/text_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextView extends StatelessWidget {
  final TextController controller = Get.put(TextController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RxString & TextField')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // TextField bound to RxString
            TextField(
              onChanged: controller.updateText,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter something...',
              ),
            ),
            SizedBox(height: 20),

            // Obx to reflect real-time changes
            Obx(() => Text(
              'You typed: ${controller.inputText}',
              style: TextStyle(fontSize: 20),
            )),
          ],
        ),
      ),
    );
  }
}
