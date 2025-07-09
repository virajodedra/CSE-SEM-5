import 'package:advance_flutter/lab_2/card_view/import_export.dart';
import '../repository/database_repository.dart';
import '../model/student.dart';

class StudentController extends GetxController{
  final DatabaseRepository repository = Get.find<DatabaseRepository>();
  var studentsList = <Student>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchStudents();
  }
  Future<void> fetchStudents() async{
    studentsList.value = await repository.getStudents();
  }

  Future<void> addStudent(Student student) async{
    await repository.addStudent(student);
    await fetchStudents();
  }

  Future<void> updateStudent(Student student) async{
    await repository.updateStudent(student);
    await fetchStudents();
  }

  Future<void> deleteStudent(int id) async{
    await repository.deleteStudent(id);
    await fetchStudents();
  }
}