import 'package:advance_flutter/lab_3/utils/import_export.dart';

class DatabaseHelper {
  static DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null && _database!.isOpen) {
      return _database!;
    }
    _database = await initDB('student.db');
    return _database!;
  }

  Future<Database> initDB(String filename) async {
    final dbpath = getDatabasesPath();
    final path = join(dbpath.toString(), filename);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
    CREATE TABLE Students(
    id INTEGER PRIMARY KEY AUTO INCREMENT,
    name TEXT,
    age INTEGER,
    email TEXT,
    phone TEXT
    )
    ''');
  }
}
