import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/student_controller.dart';
import './student_form_screen.dart';


class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  final StudentController controller = Get.find<StudentController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student List')),
      body: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) {
            final student = controller.studentsList[index];
            return ListTile(
              title: Text(student.name),
              subtitle: Text('Age : ${student.age} | ${student.email}'),
            );
          },
          itemCount: controller.studentsList.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => FormScreen()),
        child: Icon(Icons.add),
      ),
    );
  }
}
