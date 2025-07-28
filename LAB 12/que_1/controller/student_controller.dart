import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/student.dart';
import '../services/api_services.dart';

class StudentController extends GetxController {
  final ApiService api = ApiService();
  final students = <Student>[].obs;
  final isLoading = false.obs;

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();


  Future<void> fetchStudents() async {
    try {
      print("📡 Fetching from: ${api.httpClient.baseUrl}/todo/student");
      final res = await api.getAllUsers();

      if (res.isOk && res.body is List) {
        final List<dynamic> jsonList = res.body;

        students.value = jsonList
            .map((e) => Student.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        Get.snackbar("Error", "Unexpected response format");
        print("🔴 API returned non-list: ${res.body}");
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
      print("❌ Exception: $e");
    }
  }




  void addStudent() async {
    isLoading.value = true;

    final student = Student(
      name: nameController.text,
      age: int.parse(ageController.text),
      email: emailController.text,
    );

    final response = await api.createUser(student);
    isLoading.value = false;

    if (response.isOk) {
      Get.snackbar("Success", "Student Added");
      clearFields();
      await fetchStudents();
    } else {
      Get.snackbar("Error", response.statusText ?? "Add Failed");
    }
  }

  void updateStudent(String id) async {
    isLoading.value = true;

    final student = Student(
      name: nameController.text,
      age: int.parse(ageController.text),
      email: emailController.text,
    );

    final response = await api.updateUser(id, student);
    isLoading.value = false;

    if (response.isOk) {
      Get.snackbar("Success", "Student Updated");
      clearFields();
      await fetchStudents();
    } else {
      Get.snackbar("Error", response.statusText ?? "Update Failed");
    }
  }

  void deleteStudentWithDialog(String id) {
    Get.defaultDialog(
      title: "Confirm Delete",
      middleText: "Are you sure you want to delete this student?",
      textConfirm: "Yes",
      textCancel: "No",
      confirmTextColor: Colors.white,
      onConfirm: () async {
        Get.back(); // Close dialog
        isLoading.value = true;

        final response = await api.deleteUser(id);
        isLoading.value = false;

        if (response.isOk) {
          Get.snackbar("Deleted", "Student successfully deleted");
          await fetchStudents();
        } else {
          Get.snackbar("Error", "Failed to delete student");
        }
      },
    );
  }

  // Clear form fields
  void clearFields() {
    nameController.clear();
    ageController.clear();
    emailController.clear();
  }

}



// // controllers/student_controller.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../model/student.dart';
// import '../services/api_services.dart';
//
// class StudentController extends GetxController {
//   final ApiService api = ApiService();
//   final students = <Student>[].obs;
//   final isLoading = false.obs;
//
//   final nameController = TextEditingController();
//   final ageController = TextEditingController();
//   final emailController = TextEditingController();
//
//   Future<void> fetchStudents() async {
//     final res = await api.getAllUsers();
//     if (res.isOk && res.body != null) {
//       students.value = List<Student>.from(
//         res.body.map((e) => Student.fromJson(e)),
//       );
//     }
//   }
//
//   void addStudent() async {
//     isLoading.value = true;
//
//     final student = Student(
//       name: nameController.text,
//       age: int.parse(ageController.text),
//       email: emailController.text,
//     );
//
//     final response = await api.createUser(student);
//     isLoading.value = false;
//
//     if (response.isOk) {
//       Get.snackbar("Success", "Student Added");
//       clearFields();
//     } else {
//       Get.snackbar("Error", response.statusText ?? "Add Failed");
//     }
//   }
//
//   void updateStudent(String id) async {
//     isLoading.value = true;
//
//     final user = Student(
//       name: nameController.text,
//       age: int.parse(ageController.text),
//       email: emailController.text,
//     );
//
//     final response = await api.updateUser(id, user);
//     isLoading.value = false;
//
//     if (response.isOk) {
//       Get.snackbar(" Success", "Student Updated");
//       clearFields();
//     } else {
//       Get.snackbar(" Error", response.statusText ?? "Update Failed");
//     }
//   }
//   void deleteStudentWithDialog(String id) {
//     Get.defaultDialog(
//       title: "Confirm Delete",
//       middleText: "Are you sure you want to delete this student?",
//       textConfirm: "Yes",
//       textCancel: "No",
//       confirmTextColor: Colors.white,
//       onConfirm: () async {
//         Get.back(); // Close dialog
//         isLoading.value = true;
//
//         final response = await api.deleteUser(id);
//         isLoading.value = false;
//
//         if (response.isOk) {
//           Get.snackbar("Deleted", "Student successfully deleted");
//           fetchStudents();
//         } else {
//           Get.snackbar("Error", "Failed to delete student");
//         }
//       },
//     );
//   }
//
//   void clearFields() {
//     nameController.clear();
//     ageController.clear();
//     emailController.clear();
//   }
// }
