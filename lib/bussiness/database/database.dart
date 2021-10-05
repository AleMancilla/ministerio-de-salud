import 'package:sqflite/sqflite.dart';

class TaskDataBase {
  late Database _db;

  initDB() async {
    _db = await openDatabase(
      'my_db2.db',
      version: 1,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE task (id INTEGER PRIMARY KEY, name TEXT NOT NULL);');
      },
    );
  }

  insert(Task task) async {
    _db.insert('task', task.toMap());
  }

  Future<List<Task>> getAllTask() async {
    List<Map<String, dynamic>> result = await _db.query('task');
    return result.map((map) => Task.fromMap(map)).toList();
  }
}

class Task {
  late String name;

  Task(this.name);

  Map<String, dynamic> toMap() {
    return {'name': name};
  }

  Task.fromMap(Map<String, dynamic> map) {
    name = map['name'];
  }
}
