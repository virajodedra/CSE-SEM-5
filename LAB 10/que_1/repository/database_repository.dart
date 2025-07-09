import '../database/databaseHelper.dart';
import '../model/student.dart';

class DatabaseRepository {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  Future<List<Student>> getStudents() async {
    final db = await dbHelper.database;

    final result = await db.query('Students');
    final List<Student> students = [];

    for (var row in result) {
      final student = Student.fromMap(row);
      students.add(student);
    }

    return students;
  }

  Future<void> addStudent(Student student) async {
    final db = await dbHelper.database;
    await db.insert('Students', student.toMap());
  }

  Future<void> updateStudent(Student student) async {
    final db = await dbHelper.database;
    await db.update('Students', student.toMap(),
        where: 'id = ?', whereArgs: [student.id]);
  }

  Future<void> deleteStudent(int stu_id) async {
    final db = await dbHelper.database;
    await db.delete('Students',
        where: 'id = ?',
        whereArgs: [stu_id]);
  }
}
