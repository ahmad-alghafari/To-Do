import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'data_base/db_helper.dart';

class PlanIt extends ChangeNotifier {
  PlanIt() {
    selectData();
    print("provide start ---------");
  }

  List<Map<String, dynamic>> notes = [];
  DB database = DB();

  // database methods start
  Future selectData() async {
    List<Map> response = await database.select("notes");
    notes = List<Map<String, dynamic>>.from(response);
    print("-----------------------------------------------------");
    print(notes);
    print("-----------------------------------------------------");

    notifyListeners();
  }

  Future<int> insertData(String jobTitle) async {
    int response =
        await database.insert("notes", {"TODO": jobTitle, "done": 0});
    return response;
  }

  deleteAllRow() {
    database.deleteRow("delete from 'notes'");
  }

  Future deleteFromDb(int id) async {
    await database.delete("notes", "id = $id");
  }

  Future updateData(int id, Map<String, Object> data) async {
    await database.update("notes", data, "id = $id");
  }
  // database methods end

  Future<void> addJob(String? jobTitle) async {
    if (jobTitle != null) {
      int id = await insertData(jobTitle);
      Map<String, dynamic> job = {"TODO": jobTitle, "DONE": 0, "ID": id};
      notes.add(job);
    } else {
      print("errrroooooooooooooor");
    }
    notifyListeners();
  }

  void deleteAll() {
    deleteAllRow();
    notes.clear();
    notifyListeners();
  }

  void done(int index, int id) {
    int doneValue = notes[index]['DONE'] == 1 ? 0 : 1;

    Map<String, Object> data = {
      "DONE": doneValue,
    };
    updateData(id, data);

    Map<String, dynamic> job = Map<String, dynamic>.from(notes[index]);
    job['DONE'] = doneValue;
    notes[index] = job;
    notifyListeners();
  }

  void delete(int index, int id) {
    deleteFromDb(id);
    notes.removeAt(index);
    notifyListeners();
  }
}
