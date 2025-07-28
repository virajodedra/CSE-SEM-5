// views/student_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/student_controller.dart';

class StudentView extends StatefulWidget {
  @override
  State<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends State<StudentView> {
  final StudentController controller = Get.put(StudentController());
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controller.fetchStudents();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student Form")),
      body: Obx(() => controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.nameController,
                    decoration: InputDecoration(labelText: "Name"),
                    validator: (value) =>
                    value!.isEmpty ? "Please enter name" : null,
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    controller: controller.ageController,
                    decoration: InputDecoration(labelText: "Age"),
                    keyboardType: TextInputType.number,
                    validator: (value) =>
                    value!.isEmpty ? "Please enter age" : null,
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    controller: controller.emailController,
                    decoration: InputDecoration(labelText: "Email"),
                    validator: (value) =>
                    value!.isEmpty ? "Please enter email" : null,
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller.addStudent();
                          }
                        },
                        child: Text("Add"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller.updateStudent("1");
                          }
                        },
                        child: Text("Update"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            Text("All Students", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Obx(() => ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.students.length,
              itemBuilder: (context, index) {
                final student = controller.students[index];
                return ListTile(
                  title: Text(student.name),
                  subtitle: Text(student.email),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      controller.deleteStudentWithDialog(student.id!);
                    },
                  ),
                );
              },
            ))
          ],
        ),
      )),
    );
  }
}

// // views/student_view.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../controller/student_controller.dart';
//
// class StudentView extends StatefulWidget {
//   @override
//   State<StudentView> createState() => _StudentViewState();
// }
//
// class _StudentViewState extends State<StudentView> {
//   final StudentController controller = Get.put(StudentController());
//
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Student Form")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Obx(() => Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: controller.nameController,
//                 decoration: InputDecoration(labelText: "Name"),
//
//               ),
//               SizedBox(height: 12),
//
//               TextFormField(
//                 controller: controller.ageController,
//                 decoration: InputDecoration(labelText: "Age"),
//                 keyboardType: TextInputType.number,
//                 validator: (value) =>
//                 value!.isEmpty ? "Please enter age" : null,
//               ),
//               SizedBox(height: 12),
//
//               TextFormField(
//                 controller: controller.emailController,
//                 decoration: InputDecoration(labelText: "Email"),
//                 validator: (value) =>
//                 value!.isEmpty ? "Please enter email" : null,
//               ),
//               SizedBox(height: 24),
//
//               // Buttons
//               controller.isLoading.value
//                   ? CircularProgressIndicator()
//                   : Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         controller.addStudent();
//                       }
//                     },
//                     child: Text("Add"),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         controller.updateStudent("1");
//                       }
//                     },
//                     child: Text("Update"),
//                   ),
//                   Column(
//                     children: [
//                       ListView.builder(
//                         itemCount: students.length,
//                         itemBuilder: (context, index) {
//                           final student = students[index];
//                           return ListTile(
//                             title: Text(student.name),
//                             subtitle: Text(student.email),
//                             trailing: IconButton(
//                               icon: Icon(Icons.delete, color: Colors.red),
//                               onPressed: () {
//                                 controller.deleteStudentWithDialog(student.id!);
//                               },
//                             ),
//                           );
//                         },
//                       )
//
//                     ],
//                   )
//                 ],
//               )
//             ],
//           ),
//         )),
//       ),
//     );
//   }
// }
