import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/custom_exception_controller.dart';

class CustomExceptionView extends StatelessWidget {
  final controller = Get.put(CustomExceptionController());
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom Exception Example")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: "Enter age"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                int age = int.tryParse(ageController.text) ?? 0;
                controller.checkAge(age);
              },
              child: Text("Validate Age"),
            ),
            SizedBox(height: 20),
            Obx(() => Text(
              controller.result.value,
              style: TextStyle(fontSize: 18, color: Colors.deepPurple),
            ))
          ],
        ),
      ),
    );
  }
}
