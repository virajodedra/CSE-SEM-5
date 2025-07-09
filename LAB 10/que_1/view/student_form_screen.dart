import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/student_controller.dart';
import '../model/student.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final controller = Get.find<StudentController>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Student')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (nameController.text.trim().isEmpty ||
                    ageController.text.trim().isEmpty ||
                    emailController.text.trim().isEmpty ||
                    phoneController.text.trim().isEmpty) {
                  return;
                }
                final age = int.tryParse(ageController.text.trim());
                if (age == null) {
                  return;
                }

                final newStudent = Student(
                  id: 0,
                  name: nameController.text.trim(),
                  age: age,
                  email: emailController.text.trim(),
                  phone: phoneController.text.trim(),
                );

                await controller.addStudent(newStudent);
                Get.back();
              },
              child: const Text('Add Student'),
            ),
          ],
        ),
      ),
    );
  }
}