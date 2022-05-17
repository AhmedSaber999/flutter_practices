import 'dart:convert';
import 'dart:io';

import 'package:state_management/models/task.dart';

import 'package:path_provider/path_provider.dart';

class LocalStorageRepository {
  LocalStorageRepository(this.tasks);

  final List<Task> tasks;

  Future<File> _getLocalFile() async {
    final root = await getApplicationDocumentsDirectory();
    final path = '${root.path}/tasks.json';

    if (await File(path).exists()) {
      return File(path);
    }
    return File(path).create(recursive: true);
  }

  Future<File> saveTasks() async {
    final file = await _getLocalFile();
    var data = tasks
        .map(
          (task) => task.toJson(),
        ).toList();
    return file.writeAsString(jsonEncode(data));
  }

  Future<List<Task>> getTasks() async {
    try {
      final file = await _getLocalFile();

      final content = await file.readAsString();
      if (content.isEmpty) {
        return [];
      }

      final List<dynamic> tasks = jsonDecode(content);

      return tasks.map((e) {
        var task = Task(e["name"]);
        task.isDone = e["isDone"];
        return task;
      }).toList();
    } catch (e) {
      // If encountering an error, return 0
      return [];
    }
  }
}
