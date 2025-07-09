import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/student_controller.dart';

class StudentListScreen extends StatelessWidget {
  final StudentController controller = Get.find<StudentController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student List')),
      body: Obx(() {
        if (controller.students.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.students.length,
          itemBuilder: (context, index) {
            final student = controller.students[index];
            return ListTile(
              title: Text(student.name),
              subtitle: Text('Age: ${student.age} | Email: ${student.email}'),
            );
          },
        );
      }),
    );
  }
}
