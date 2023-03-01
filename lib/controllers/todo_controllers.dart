import 'package:flutter/cupertino.dart';

class ToDoController extends ChangeNotifier {
  final List<dynamic> _totalTasks = [];
  int _numberOfCompletedTasks = 80;
  int _numberOfIncompleteTasks = 120;
  int _numberOfEditedTasks = 0;
  // final List<ToDoApiModel> _incompleteTasks = [];

  get numberOfCompletedTasks => _numberOfCompletedTasks + _numberOfEditedTasks;
  get numberOfIncompleteTasks =>
      _numberOfIncompleteTasks - _numberOfEditedTasks;

  set setNoOfCompletedTasks(int value) {
    _numberOfCompletedTasks = value;
    notifyListeners();
  }

  set setNoOfInCompleteTasks(int value) {
    _numberOfIncompleteTasks = value;
    notifyListeners();
  }

  get totalTasks => _totalTasks;
  set editTask(bool value) {
    if (value) {
      _numberOfEditedTasks += 1;
    } else {
      _numberOfEditedTasks -= 1;
    }
    notifyListeners();
  }
  // get inCompleteTasks => _incompleteTasks;

  // set addCompleteTasks(ToDoApiModel data) {
  //   _completedTasks.add(data);
  //   notifyListeners();
  // }

  // set addinCompleteTasks(ToDoApiModel data) {
  //   _incompleteTasks.add(data);
  //   notifyListeners();
  // }

  // set toggleCompletion(int index) {
  //   _incompleteTasks.insert(0, _completedTasks[index]);
  //   _completedTasks.removeAt(index);
  //   notifyListeners();
  // }

  // set toggleInCompletion(int index) {
  //   _completedTasks.insert(0, _completedTasks[index]);
  //   _incompleteTasks.removeAt(index);
  //   notifyListeners();
  // }
}
