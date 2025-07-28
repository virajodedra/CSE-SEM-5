import 'package:get/get.dart';
import '../model/student.dart';

class ApiService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = "https://67b41a5c392f4aa94fa95325.mockapi.io";
    super.onInit();
  }

  Future<Response> getAllUsers() => get("/todo/student");
  Future<Response> createUser(Student user) => post("/todo/student", user.toJson());
  Future<Response> updateUser(String id, Student user) => put("/todo/student/$id", user.toJson());
  Future<Response> deleteUser(String id) => delete("/todo/student/$id");
}




//
// import 'package:get/get.dart';
// import '../model/student.dart';
//
// class ApiService extends GetConnect {
//   final String baseUrl = "https://67b41a5c392f4aa94fa95325.mockapi.io/todo/student";
//
//   @override
//   void onInit() {
//     httpClient.baseUrl = baseUrl;
//     super.onInit();
//   }
//
//   Future<Response> getAllUsers() => get('/');
//
//   Future<Response> createUser(Student user) => post("/", user.toJson());
//
//   Future<Response> updateUser(String id, Student user) => put("/$id", user.toJson());
//
//   Future<Response> deleteUser(String id) async {
//     return delete('/$id');
//   }
// }
