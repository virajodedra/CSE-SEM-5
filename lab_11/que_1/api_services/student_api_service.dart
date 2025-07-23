import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/student.dart';
import 'api_service.dart';

class StudentApiService implements ApiService {
   String baseUrl = 'https://67b41a5c392f4aa94fa95325.mockapi.io/todo/student';

  @override
  Future<List<dynamic>> getStudents() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
       List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Student.fromJson(json)).toList();
    } else {
      return [];
    }
  }
}