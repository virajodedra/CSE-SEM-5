import 'package:get/get.dart';
import '../api_services/api_service.dart';
import '../api_services/student_api_service.dart';
import '../model/student.dart';


class StudentController extends GetxController {
  final ApiService apiService = Get.find<StudentApiService>();
  var students = <Student>[].obs;


  @override
  void onInit() {
    super.onInit();
    fetchStudents();
  }

  Future<void> fetchStudents() async {
    final response = await apiService.getStudents();

      students.value = response.cast<Student>();
  }
}