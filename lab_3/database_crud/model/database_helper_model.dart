import 'package:advance_flutter/lab_3/utils/import_export.dart';

class DatabaseHelper {
  Database? _database;

  Future<void> open() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'todos.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE todos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            description TEXT NOT NULL
          )
        ''');
      },
    );
  }

  Future<void> addTodo(String title, String description) async {
    if (_database == null) {
      await open();
    }
    await _database!.insert('todos', {
      'title': title,
      'description': description,
    });
  }

  Future<List<Map<String, dynamic>>> getAllTodos() async {
    if (_database == null) {
      await open();
    }
    return await _database!.query('todos');
  }

  Future<void> updateTodo(int id, String title, String description) async {
    if (_database == null) {
      await open();
    }
    await _database!.update(
      'todos',
      {'title': title, 'description': description},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteTodo(int id) async {
    if (_database == null) {
      await open();
    }
    await _database!.delete(
      'todos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}